// Mutlaka bir lisans identifier koymalısın.
// Daha sonra compiler sürümü girmelisin. Bir range de olabilir bu.

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

contract SimpleStorage {
    // ###### VARIABLES ######

    /*
    bool hasFovariteNumber = true;
    uint256 favoriteNumber = 123123123;
    string favoriteNumberInText = "onetwothreeonetwothree";
    int256 intFavoriteNumber = -5;
    address myAddress = 0xFfF093CBfe5A1f3dF80F31538Bac4955500957e9;
    bytes32 favoriteBytes = "cat";
    */

    // Eğer hiçbir değer atamazsam default değerler alır.
    uint256 public favoriteNumber; // Equals 0
    // Public ifadesi bir getter function oluşturur.

    // ###### FUNCTIONS ######

    function store(uint256 _favoriteNumber) public {
        /*
            public -> Dışarıdan çalıştırılabilir.
            private -> Dışarıdan çalıştırılamaz.
            external -> Dışarıdan çalıştırılamaz, farklı kontrattan çalıştırılabilir.
            internal (default) -> Dışarıdan çalıştırılamaz. Sadece bu kontrat içinde çalıştırılır.
        */
        favoriteNumber = _favoriteNumber;
        // ++favoriteNumber;
    }

    // View ve pure functionlarda gaz kullanmayız. Başka bir fonksiyon içinde kullanmadığın sürece.
    function retrieve() public view returns(uint256) {
        return favoriteNumber;
    }

    function add() public pure returns(uint256) {
        return ( 1 + 1 );
    }

    // Syntax nerederyse ts ile aynı.
    // Scope mevzusu da aynı.

    // ###### ARRAYS AND STRUCTS ######
    // Aynı TS'teki gibi struct tanımlayabilirsin.

    struct Person {
        uint256 age;
        string name;
    }

    Person public feyyaz = Person({ age: 21, name: "Feyyaz" });

    // Bir array'e dönüştürülebilir.
    Person[] public people; // Dynamic Array
    Person[3] public limitedPeople; // Fixed Size Array

    // calldata, memory, storage
    function addPerson(string memory _name, uint256 _age) public {
        // Person memory temp = Person(_age, _name); // -> Bu şekilde de kullanılabilir.
        // people.push(temp);

        people.push(Person(_age, _name));
        nameToAge[_name] = _age;
    }

    // EVM can access and store information in six places:
    //      Stack
    //      Memory -> it will deleted after usage -> changable
    //      Storage -> it wont deleted after usage -> changable         => Bu üçü array, struct gibi türlerle kullanılır. Diğer türlü solidity nerede saklayacağını biliyor.
    //      Calldata -> it will deleted after usage -> not changable
    //      Code
    //      Logs

    // ###### MAPPINGS ######
    // Diyelim ki isim ile yaş aratmak istiyorum. Mapping ile bir dictionary oluşturabiliyorum.

    mapping(string => uint256) public  nameToAge;
}

// Deployed Address -> 0xd9145CCE52D386f254917e481eB44e9943F39138
