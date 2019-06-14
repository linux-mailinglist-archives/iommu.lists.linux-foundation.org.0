Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 41935458EC
	for <lists.iommu@lfdr.de>; Fri, 14 Jun 2019 11:39:22 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 3D13A10C5;
	Fri, 14 Jun 2019 09:39:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 36137109F
	for <iommu@lists.linux-foundation.org>;
	Fri, 14 Jun 2019 09:39:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 9B7BC174
	for <iommu@lists.linux-foundation.org>;
	Fri, 14 Jun 2019 09:39:18 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id 78CBC396; Fri, 14 Jun 2019 11:39:16 +0200 (CEST)
Date: Fri, 14 Jun 2019 11:39:15 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [git pull] IOMMU Fixes for Linux v5.2-rc4
Message-ID: <20190614093854.GA10155@8bytes.org>
MIME-Version: 1.0
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Development issues for Linux IOMMU support
	<iommu.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
	<mailto:iommu-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu@lists.linux-foundation.org>
List-Help: <mailto:iommu-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
	<mailto:iommu-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============6492261304282828606=="
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org


--===============6492261304282828606==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WIyZ46R2i8wDzkSu"
Content-Disposition: inline


--WIyZ46R2i8wDzkSu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

The following changes since commit cd6c84d8f0cdc911df435bb075ba22ce3c605b07:

  Linux 5.2-rc2 (2019-05-26 16:49:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git tags/iommu-fixes-v5.2-rc4

for you to fetch changes up to 4e4abae311e4b44aaf61f18a826fd7136037f199:

  iommu/arm-smmu: Avoid constant zero in TLBI writes (2019-06-12 10:08:56 +0200)

----------------------------------------------------------------
IOMMU Fixes for Linux v5.2-rc4

Including:

	- Three Fixes for Intel VT-d to fix a potential dead-lock, a
	  formatting fix and a bit setting fix.

	- One fix for the ARM-SMMU to make it work on some platforms
	  with sub-optimal SMMU emulation.

----------------------------------------------------------------
Dave Jiang (1):
      iommu/vt-d: Fix lock inversion between iommu->lock and device_domain_lock

Lu Baolu (2):
      iommu: Add missing new line for dma type
      iommu/vt-d: Set the right field for Page Walk Snoop

Robin Murphy (1):
      iommu/arm-smmu: Avoid constant zero in TLBI writes

 drivers/iommu/arm-smmu.c    | 15 ++++++++++++---
 drivers/iommu/intel-iommu.c |  7 ++++---
 drivers/iommu/intel-pasid.c |  2 +-
 drivers/iommu/iommu.c       |  2 +-
 4 files changed, 18 insertions(+), 8 deletions(-)

Please pull.

Thanks,

	Joerg

--WIyZ46R2i8wDzkSu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEr9jSbILcajRFYWYyK/BELZcBGuMFAl0Day4ACgkQK/BELZcB
GuN4XQ/9ESs/R57pgy5JsASOyxos6MfTmVTEBk3lKl2TIB0CUs9P8KMp8etYT/kI
Uk0UefkoWyiXpUWmdqQ8SGirAwoV7qHTDNVVbIjDTogjrMEYllPohG9Gli94PcJO
/Fgoq1MEv5dibOKSctR3zsCzRwr0bhjJVNezQxvwVUvZmwee6dlpVg279Xki5sia
H/zzsiCt69fqLT2mlUCo96GsbAJPlLHXNZa1Nrm306GL9LvxtTHfTWq9vmVKBpzI
e9bRQYNUMEuW+QOfuxcKtBf4oNN3nMrIVjq7YIsMPUyjkvSSk7jDN1rtZOERg583
dEL1pgjIZ1HVdjvZaefRT794PDlC+199FPSmKOzMWGvZ3QTymUHjUg379PkJkUC1
dTfNg7ahdggj/yzmEs1ZFg8Pwz3ZMdnoLOWRNRg+VPVMianvp1EOVvUCZPvJhE6S
grgtsvJPbrJZc++zCevSQSZqqfzGmhyHUWBhIbme9Ia6iwEMzCP3z8Lq4SwKUO83
/mjw84X1ve/x93kvr6jOlOzJVKV+bsH+ETGAc3OTkOMqA9P2cjf2o3oGHgDcahtC
Sc4QkoC5rHZgIOgierv+iwvGBj3SvCTnEYH4qBvMOHIzPUd3ugpgKKXf5BnyekYP
3ydQx9K9oDXzisCJY9TQXyBT7dowF7TbCKmJFsND5DYBeH3b4kg=
=uyv9
-----END PGP SIGNATURE-----

--WIyZ46R2i8wDzkSu--

--===============6492261304282828606==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============6492261304282828606==--
