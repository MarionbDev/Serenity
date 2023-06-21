import HeaderMobilePrepaPatient from "../components/HeaderMobilePrepaPatient";
import HeaderPreparation from "../components/HeaderPreparation";

function PreparationEtapeFour() {
  return (
    <>
      <div>
        <HeaderMobilePrepaPatient />
        <HeaderPreparation
          text="Anticiper ma sortie en prenant rendez-vous"
          color="bg-green-400"
        />
        <p className="ml-10 mb-2 mr-5">
          Afin de securiser votre retour à la maison votre chirurgien vous
          invite à prendre rendez-vous avec les professionnels de santé suivant:
        </p>
      </div>
      <div className=" m-8 ">
        <button
          value="Kinésithérapeute"
          type="button"
          className=" h-12 rounded-xl bg-green-400"
        >
          <p className="p-4 text-base w-52 text-white">Kinésithérapeute</p>
        </button>
        <button
          value="Infirmier"
          type="button"
          className=" h-12 rounded-xl mt-4 bg-green-400"
        >
          <p className="p-4 text-base w-52 text-white">Infirmier</p>
        </button>
        <button
          value="Psychologue"
          type="button"
          className=" h-12 rounded-xl mt-4 bg-green-400"
        >
          <p className="p-4 text-base w-52 text-white">Psychologue</p>
        </button>
      </div>
    </>
  );
}

export default PreparationEtapeFour;
