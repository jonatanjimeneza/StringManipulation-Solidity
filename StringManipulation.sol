// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.13;

//Smart contract para manipular un string
contract Strings{
    //función para obtener el largo de un string
    function length(string memory _strng)pure public returns(uint){
        //Para obtener el largo de un string debemos de "Transformar" el string en bytes.
        bytes memory _strng_bytes = bytes(_strng);
        return _strng_bytes.length;
    }

    function concatenante(string memory _str1, string memory _str2) pure public returns(string memory)
{
        //Para concatenar dos string con solidity actualmente solo es posible si los pasamos a bytes de la siguiente forma:
        bytes memory str1_bytes = bytes(_str1);
        bytes memory str2_bytes = bytes(_str2);
        //Creamos un nuevo string de los dos string que hemos pasado a bytes
        string memory str = new string(str1_bytes.length + str2_bytes.length);
        //Volvemos a pasar el nuevo string a bytes
        bytes memory str_bytes = bytes(str);
        
        //Hacemos un loop de todos los bytes del string1 y string2 para luego copiarlo en el output del string que hemos llamado str_bytes
        uint j=0;
        for(uint i=0; i<str1_bytes.length;i++){
            str_bytes[j] = str1_bytes[i];
            j++;
        }

        for(uint i=0; i<str2_bytes.length;i++){
            str_bytes[j] = str2_bytes[i];
            j++;
        }

        return string(str_bytes);

}
}
