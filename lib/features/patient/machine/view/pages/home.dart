import 'package:btcare/core/extention/extentions.dart';
import 'package:btcare/core/model/get_allprofiles_response.dart';
import 'package:btcare/core/utils/spaceing/spaceing.dart';
import 'package:btcare/features/patient/machine/manager/machine_cubit.dart';
import 'package:btcare/features/patient/machine/view/widgets/build_doctor.dart';
import 'package:btcare/features/patient/machine/view/widgets/tumor_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Recommendation Doctors',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff393939),
                ),
                textAlign: TextAlign.start,
              ),
              const VerticalSpace(20),
              SizedBox(
                height: 130,
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    return ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => BuildDoctorIcon(
                          data: cubit.doctorsProfiles?[index] ??
                              GetAllProfileResponse()),
                      separatorBuilder: (context, index) =>
                          const HorizantelSpace(8),
                      itemCount: cubit.doctorsProfiles?.length ?? 0,
                    );
                  },
                ),
              )
            ],
          ),
        ),
        const SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VerticalSpace(30),
              Text(
                'Types of brain tumor',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff393939),
                ),
              ),
              VerticalSpace(20),
              TumorInformation(
                image: 'assets/images/glioma.png',
                txt1: 'Gliomas',
                txt2:
                    '''Gliomas are tumors originating in glial cells that support and nourish nerve cells in the brain.
They are the most common type of primary brain tumors and can occur in different parts of the brain. Gliomas are classified into different grades based on their aggressiveness and how quickly they are likely to grow. The grades range from low-grade (slow-growing) to high-grade (fast-growing) tumors. Common symptoms of gliomas include headaches, seizures, cognitive changes, and neurological deficits. Treatment options for gliomas may include surgery, radiation therapy, and chemotherapy, depending on the tumor's location, grade, and the overall health of the patient. The prognosis for gliomas varies depending on several factors, including the tumor grade, size, location, and the patient's age and overall health.''',
              ),
              VerticalSpace(20),
              TumorInformation(
                image: 'assets/images/pituitarytumor.png',
                txt1: 'Pituitary ',
                txt2: '''growths that develop in the pituitary gland.
These tumors can be noncancerous (benign) or cancerous (malignant). Pituitary tumors can disrupt the normal functioning of the pituitary gland, which is responsible for producing and regulating various hormones in the body. As a result, they can cause hormonal imbalances and lead to a range of symptoms, such as headaches, vision problems, hormonal changes, fatigue, and infertility. Treatment options for pituitary tumors include medication, surgery, and radiation therapy, depending on the size, type, and location of the tumor. The prognosis for pituitary tumors varies depending on several factors, including tumor size, type, and the individual's overall health.''',
              ),
              VerticalSpace(20),
              TumorInformation(
                image: 'assets/images/anotherTumor.png',
                txt1: 'meningioma ',
                txt2:
                    ''' is a tumor that grows from the membranes that surround the brain and spinal cord, called the meninges. A meningioma is not a brain tumor, but it may press on the nearby brain, nerves and vessels. Meningioma is the most common type of tumor that forms in the head.
Most meningiomas grow very slowly. They can grow over many years without causing symptoms. But sometimes, their effects on nearby brain tissue, nerves or vessels may cause serious disability.

Meningiomas occur more often in women. They're often found at older ages. But they can happen at any age.
''',
              )
            ],
          ),
        )
      ],
    ).setPadding(context, horizontal: 20, vertical: 20);
  }
}
