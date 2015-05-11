package com.technos.util;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * Esta classe traduz n�meros de sua forma numeral para sua forma por extenso.
 * 
 * @author girino
 * 
 * Regras:
 * 1. numeros abaixo de 20 tem nome pr�prio.
 * 2. de 21 a 99 os numeros s�o formados por DEZENA 'e' UNIDADE (exemplo: "trinta e cinco")
 * 3. dezenas redondas n�o tem nada depois (20 -> "vinte", e n�o "vinte e zero").
 * 4. 100 tem nome pr�prio: cem
 * 5. n�meros maiores que cem s�o compostos por CENTENA 'e' extenso(numero % 100), onde extenso() � a fun��o que converte n�meros menores que 100.
 *    (exemplos: cento e vinte e um, quinhentos e quarenta).
 * 6. acima de 1000 agrupa-se em blocos de 3 d�gitos (pot�ncias de 1000) onde a representa��o 
 *    descrita em 5 � usada internametne, posfixados pelo descritor do grupo (mil, milh�o, etc). Os grupos s�o concatenados por virgula (opcional)
 * 6a. A ultima concatena��o � feita por "e".
 * 6a1. A ultima concatena��o � omitida (Ou substituida por v�rgula) caso o ultimo grupo seja maior que 100 e n�o seja m�ltiplo e 100.
 * 6b. o "um" em frente ao descritor de grupo "mil" � opcional e deve ser parametriz�vel.
 *     Exemplos:
 *               mil e um.
 *               duzentos milh�es, vinte mil e dez.
 *               um milh�o, dois mil duzentos e cinquenta.
 *               um milh�o, dois mil e quarenta e cinco.
 * 7. Ao acrescentar a unidade (por exemplo, "reais") usa-se o prefixo "de" antes da undiade caso o ultimo seja de milh�o ou maior. 
 *    Exemplos:
 *              mil reais.
 *              um milh�o de reais.
 *              dois bilh�es de reais.
 *              um milh�o, cento e vinte mil duzentos e cinquenta reais.
 */

public class ValorExtenso3 {

        /* par�metros */
        private boolean milSemUm = false;
        private TipoSeparador separadorGrupo = TipoSeparador.VIRGULA;
        /* este par�metro n�o deveria existir, j� que segundo as gram�ticas omite-se apenas depois de mil */
        private TipoSeparador separadorUltimoGrupo = TipoSeparador.VIRGULA;
        private TipoSeparador separadorDepoisDeMil = TipoSeparador.VIRGULA;


        /**
         * O construtor permite que se crie novas inst�ncias paramterizadas de forma distinta do padr�o.
         * Os parametros opcionais definem:
         * 1. Se o descritor de milhares ser� prefixado por 1 quando for o caso ("um mil" ao inv�s de apenas "mil");
         * 2. Se a v�rgula depois dos descritores de potencias de dez (mil, milh�o, bilh�o, etc) 
         *    ser� omitda;
         * 3. Se haver� v�rgula do descritor "mil" ("dez mil, duzentos e cinquenta" contra "dez mil duzentos e cinquenta").
         *  
         * @param milSemUm Caso seja "true", o "um" ser� omitido antes dos milhares.
         * @param virgulaEntreGrupos Caso seja true usa-se a v�rgula, caso false, ser� omitida.
         * @param virgulaDepoisDeMil Caso seja true usa-se o que for determinado pelo 
         *                                                              parametro virgulaEntreGrupos, caso seja false, 
         *                                                              omite-se a virgula em todos os casos.
         */
        public ValorExtenso3(boolean milSemUm, boolean virgulaEntreGrupos, boolean virgulaDepoisDeMil) {
                this.milSemUm = milSemUm;
                separadorGrupo = virgulaEntreGrupos?TipoSeparador.VIRGULA:TipoSeparador.NENHUM;
                separadorUltimoGrupo = separadorGrupo;
                // virgula depois de mil s� faz sentido se o separador for virgula
                separadorDepoisDeMil = virgulaDepoisDeMil?separadorGrupo:TipoSeparador.NENHUM;
        }
        
        private static ValorExtenso3 defaultInstance = new ValorExtenso3(false, true, true);
        /**
         * singleton
         * @return a inst�ncia default.
         */
        public static ValorExtenso3 getDefaultInstance() {
                return defaultInstance;
        }
        

        private enum TipoSeparador {
                NENHUM(" "),
                E(" e "),
                VIRGULA(", "),
                DE(" de ");

                String separadorStr;

                TipoSeparador(String separadorStr) {
                        this.separadorStr = separadorStr;
                } 

                public String getSeparador() {
                        return separadorStr;
                }
        }

        public static final String ZERO = "zero";
        public static final String CEM = "cem";
        public static final BigDecimal C_1000 = new BigDecimal(1000);
        public static final BigDecimal C_100 = new BigDecimal(100);
        public static final BigDecimal C_0 = new BigDecimal(0);

        public static String[] UNIDADES = {
                "", "um", "dois", "tr\u00EAs", "quatro", "cinco", "seis", "sete", "oito", "nove", 
            "dez", "onze", "doze", "treze", "quatorze","quinze","dezesseis","dezessete","dezoito","dezenove"
        };

        public static String[] DEZENAS = {
                "","", "vinte", "trinta", "quarenta", "cinquenta", "sessenta", "setenta", "oitenta", "noventa"
        };

        public static String[] CENTENAS = {
                "", "cento", "duzentos", "trezentos", "quatrocentos", "quinhentos", "seiscentos", "setecentos", "oitocentos", "novecentos"
        };

        public static String[] ordensSingular= {
                "", "mil", "milh\u00E3o", "bilh\u00E3o", "trilh\u00E3o", "quatrilh\u00E3o", "quintilh\u00E3o", "sextilh\u00E3o", "setilh\u00E3o", "octilh\u00E3o", "nonilh\u00E3o", 
           "decilh\u00E3o", "undecilh\u00E3o", "dodecilh\u00E3o", "tredecilh\u00E3o", "quatordecilh\u00E3o", "quindecilh\u00E3o", "sedecilh\u00E3o", "septendecilh\u00E3o"
        };

        public static String[] ordensPlural = {
                "", "mil", "milh\u00F5es", "bilh\u00F5es", "trilh\u00F5es", "quatrilh\u00F5es", "quintilh\u00F5es", "sextilh\u00F5es", "setilh\u00F5es", "octilh\u00F5es", 
                "decilh\u00F5es", "undecilh\u00F5es", "dodecilh\u00F5es", "tredecilh\u00F5es", "quatordecilh\u00F5es", "quindecilh\u00F5es", "sedecilh\u00F5es", "septendecilh\u00F5es" 
        };

        /**
         * converte valores menores que 20.
         */
        String unidades(int n) {
                if (n == 0) return ZERO;
                if (n < UNIDADES.length) return UNIDADES[n];
                throw new RuntimeException("valor: " + n);
        }

        /**
         * Converte valores menores que 100. Utiliza o m�todo unidades() auxiliarmente.
         */
        String dezenas(int n) {
                if (n < UNIDADES.length) return unidades(n);
                int unidade = n % 10;
                n = n / 10;
                // ignora o 0 em dezenas redondas (20, 30, 40, etc)
                String unidadeStr = "";
                if (unidade != 0) {
                        unidadeStr = TipoSeparador.E.getSeparador() + unidades(unidade);
                }
                if (n < DEZENAS.length) return DEZENAS[n] + unidadeStr;
                throw new RuntimeException();
        }

        /**
         * Converte valores menores que 1000 usando dezenas() auxiliarmente.
         */
        String centenas(int n) {
                // caso especial "100", tratado a parte.
                if (n == 100) return CEM;
                if (n < 100) return dezenas(n);
                // separa centenas e dezenas
                int rem = n % 100;
                n = n/100;
                String dezenaStr = "";
                if (rem != 0) {
                        dezenaStr = TipoSeparador.E.getSeparador() + dezenas(rem);
                }
                if (n < CENTENAS.length) return CENTENAS[n] + dezenaStr;
                throw new RuntimeException();
        }

        /**
         * monta grupos de 3 d�gitos junto com seu sufixo, identificando o 
         * uso de plural quando necess�rio.
         */
        String montaGrupo(int n, int grupo) {
                if (n == 0) return "";
                String nomeGrupo = "";
                if (n == 1) {
                        // mil � exce��o, regra 6b.
                        if (grupo == 1 && milSemUm) {
                                return ordensSingular[grupo];
                        }
                        nomeGrupo = ordensSingular[grupo];
                } else {
                        nomeGrupo = ordensPlural[grupo];
                }
                if (grupo == 0) return centenas(n); // pra evitar "trailling space"
                return centenas(n) + TipoSeparador.NENHUM.getSeparador() + nomeGrupo;
        }

        private class TuplaGrupo {
                Integer valor;
                Integer posicao;
                String extenso;
                public TuplaGrupo(Integer valor, Integer posicao, String extenso) {
                        this.valor = valor;
                        this.posicao = posicao;
                        this.extenso = extenso;
                }
                public Integer getValor() {
                        return this.valor;
                }
                public Integer getPosicao() {
                        return this.posicao;
                }
                public String getExtenso() {
                        return this.extenso;
                }
        }

        protected List<TuplaGrupo> montaGrupos(BigDecimal n) {
                List<TuplaGrupo> grupos = new ArrayList<TuplaGrupo>();
                int i = 0;
                while (n.compareTo(C_0) > 0) {
                        BigDecimal[] tmp = n.divideAndRemainder(C_1000);
                        if (tmp[1].intValue() > 0) {
                                TuplaGrupo grupo = new TuplaGrupo(tmp[1].intValue(), i, montaGrupo(tmp[1].intValue(), i));
                                grupos.add(grupo);
                        }
                        n = tmp[0];
                        i++;
                }
                return grupos;
        }

        protected String reagrupa(List<TuplaGrupo> grupos) {
                // avalia regra 6a1: ultimo grupo � > 100 e n�o � multiplo de 100
                boolean omiteUltimoSeparador = false;
                if (grupos.get(0).getValor() > 100 && grupos.get(0).getValor() % 100 != 0) {
                        omiteUltimoSeparador = true;
                }
                Iterator<TuplaGrupo> it = grupos.iterator();
                String ret = it.next().getExtenso();
                if (!omiteUltimoSeparador && it.hasNext()) {
                        ret = it.next().getExtenso() + TipoSeparador.E.getSeparador() + ret;
                } else if (it.hasNext()) {
                        TuplaGrupo grupo = it.next();
                        TipoSeparador separador = grupo.getPosicao().equals(1)?separadorDepoisDeMil:separadorUltimoGrupo;
                        ret = grupo.getExtenso() + separador.getSeparador() + ret;
                }
                while (it.hasNext()) {
                        ret = it.next().getExtenso() + separadorGrupo.getSeparador() + ret;
                }
                return ret;
        }

        /**
         * Implementa a regra 6:
         * Separa em grupos de 3 d�gitos (potencias de 1000), processa os grupos separadamente
     * e depois reagrupa, separando por virgula exceto no ultimo separador, que pode ser
         * "e" ou entao ser omitido (regra 6a e 6a1).
         **/
        public  <T extends Number> String converteInteiro(T number) {
                BigDecimal n = new BigDecimal(number.toString());
                // na verdade a penas o 0 precisa ser exce��o, mas isso poupa esfor�o.
                if (n.compareTo(C_1000) < 0) return centenas(n.intValue());

                List<TuplaGrupo> grupos = montaGrupos(n);
                return reagrupa(grupos);
        }

        String principal(BigDecimal n, String[] nomesMoeda) {
                String nomeMoeda = nomesMoeda[1];
                if (n.compareTo(BigDecimal.ONE) == 0) {
                        nomeMoeda = nomesMoeda[0];
                }
                if (n.compareTo(C_1000) < 0) return centenas(n.intValue()) + TipoSeparador.NENHUM.getSeparador() + nomeMoeda;
                List<TuplaGrupo> grupos = montaGrupos(n);
                TipoSeparador separador = TipoSeparador.NENHUM;
                // se for maior que milh�o, usa "de" (regra 7).
                if (grupos.get(0).getPosicao() >= 2) {
                        separador = TipoSeparador.DE;
                }
                return reagrupa(grupos) + separador.getSeparador() + nomeMoeda;
        }

        String subdivisao(BigDecimal n, String[] nomesSubdivisao, int escalaSubdivisao) {
                // basicamente � executar o principal da subdivisao * escala.
                return principal(n.multiply(new BigDecimal(escalaSubdivisao)).divideToIntegralValue(BigDecimal.ONE), nomesSubdivisao);
        }

        /**
         * Similar ao converteInteiro(), mas usa o sufixo da moeda fornecido (e.g. real, dollar, etc) 
         * e computa as casas decimais (centavos) de acordo com a escala fornecida e 
         * usando os nomes fornecidos para a subdivis�o da moeda.
         * 
         * � necess�rio os nomes no singular e no plural para a moeda, bem como para a subdivis�o. 
         * A escala deve ser preferencialmente um m�ltiplo de 10, j� que a nota��o original � decimal.
         * O funcionamento para escalas diferentes desse formato n�o � garantido.
         * 
         * @param n N�mero a ser convertido.
         * @param nomesMoeda vetor contendo o nome no singular e no plural da moeda.
         * @param nomesSubdivisao vetor contendo o nome no singular e no plural da subdivis�o da moeda.
         * @param escalaSubdivisao escala usada na subdivis�o (100 para centavos).
         * @return O valor escrito por extenso.
         */
        public  <T extends Number> String converteMoeda(T number, String[] nomesMoeda, String[] nomesSubdivisao, int escalaSubdivisao) {
                BigDecimal n = new BigDecimal(number.toString());
                BigDecimal[] split = n.divideAndRemainder(BigDecimal.ONE);

                // se n�o houver centavos, s� retorna o principal
                if (split[1].compareTo(BigDecimal.ZERO) == 0) {
                        return principal(split[0], nomesMoeda);
                }
                // se n�o houver principal, s� retorna os centavos
                if (split[0].compareTo(BigDecimal.ZERO) == 0) {
                        return subdivisao(split[1], nomesSubdivisao, escalaSubdivisao);
                }
                return principal(split[0], nomesMoeda) + TipoSeparador.E.getSeparador() + subdivisao(split[1], nomesSubdivisao, escalaSubdivisao);
        }
        /**
         * Este m�todo � usado quando a moeda � o real (BRL), subdividido em centavos.
         * 
         * @param n N�mero a ser convertido.
         * @return O valor escrito por extenso.
         */
        public <T extends Number> String converteMoeda(T numero) {
                return converteMoeda(numero, new String[] {"real", "reais"}, new String[] {"centavo", "centavos"}, 100);
        }       
}