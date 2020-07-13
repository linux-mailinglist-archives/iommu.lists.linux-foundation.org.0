Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id CA55521DA3A
	for <lists.iommu@lfdr.de>; Mon, 13 Jul 2020 17:37:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 680348890E;
	Mon, 13 Jul 2020 15:37:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LuhXIDmN4do0; Mon, 13 Jul 2020 15:37:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 044478890B;
	Mon, 13 Jul 2020 15:37:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DD01AC0733;
	Mon, 13 Jul 2020 15:37:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 11A4BC0733
 for <iommu@lists.linux-foundation.org>; Mon, 13 Jul 2020 15:37:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id EFCFF2045F
 for <iommu@lists.linux-foundation.org>; Mon, 13 Jul 2020 15:36:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aJ0COZj-2BUH for <iommu@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 15:36:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id 2F89720395
 for <iommu@lists.linux-foundation.org>; Mon, 13 Jul 2020 15:36:59 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 33070379; Mon, 13 Jul 2020 17:36:56 +0200 (CEST)
Date: Mon, 13 Jul 2020 17:36:54 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [git pull] IOMMU Fixes for Linux v5.8-rc5
Message-ID: <20200713153649.GA2615@8bytes.org>
MIME-Version: 1.0
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
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
Content-Type: multipart/mixed; boundary="===============5269226139608967909=="
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>


--===============5269226139608967909==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3MwIy2ne0vdjdPXF"
Content-Disposition: inline


--3MwIy2ne0vdjdPXF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

The following changes since commit 9ebcfadb0610322ac537dd7aa5d9cbc2b2894c68:

  Linux 5.8-rc3 (2020-06-28 15:00:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git tags/iommu-fixes-v5.8-rc5

for you to fetch changes up to a082121b55bac125f7d09d78de00607ea75a6903:

  iommu/arm-smmu: Mark qcom_smmu_client_of_match as possibly unused (2020-07-09 17:20:22 +0200)

----------------------------------------------------------------
IOMMU Fixes for Linux v5.8-rc5:

Including:

	- Fix for a use-after-free of the device iommu-group. Found in the
	  arm-smmu driver, but the fix is in generic code.

	- Fix for the new Allwinner IOMMU driver to use the atomic
	  readl_timeout() variant in IO/TLB flushing code.

	- A couple of cleanups to fix various compile warnings.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      iommu: SUN50I_IOMMU should depend on HAS_DMA

Joerg Roedel (1):
      iommu/amd: Make amd_iommu_apply_ivrs_quirks() static inline

Jordan Crouse (1):
      iommu/arm-smmu: Mark qcom_smmu_client_of_match as possibly unused

Maxime Ripard (2):
      iommu/sun50i: Change the readl timeout to the atomic variant
      iommu/sun50i: Remove unused variable

Qian Cai (1):
      iommu: Fix use-after-free in iommu_release_device

 drivers/iommu/Kconfig         | 1 +
 drivers/iommu/amd/amd_iommu.h | 2 +-
 drivers/iommu/arm-smmu-qcom.c | 2 +-
 drivers/iommu/iommu.c         | 2 +-
 drivers/iommu/sun50i-iommu.c  | 8 +++-----
 5 files changed, 7 insertions(+), 8 deletions(-)

Please pull.

Thanks,

	Joerg

--3MwIy2ne0vdjdPXF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEr9jSbILcajRFYWYyK/BELZcBGuMFAl8Mf44ACgkQK/BELZcB
GuOffw//fCaeb/TOZG6EmMVwNzc2L+qj0Ja5u4ng5pemQxsQpjXjog/zB2ayDbLx
tIRWThvlEtbnMHlZGsqPyVIqqWb1qAJk6Kn1IUmTG0JxWN/+SX8fewyCQRMiLYDS
ifGCVUTM84O5I8QpDtDsdTrBgUUph/Pf8P3zeiBEA2mbmsm+CrSj2yYI44xGUhiD
NhCTc7eCf1HZOdBAF15nPRqacPLyS2ZpviLodmujquh80kauRkBDu1GHCoFhcIJ7
LJl/olALhhmV2mCiptXBHvd0/m90PxH9V38JKElptXsAIL74hmNMG5thbEtRTv5C
xNrSkAniPnKRU96L49X5qT3hHixxEWK2Mb4ZEV+droefG5I1DOeo/DOaikPEhgTS
jXfRysXe4CKEbMoWRcibJOaUjkyvr3vjd5n92sgYxMjTYuTnQvSg8OJKNTBR7zLz
SUhwNyHVQ3jCnqOjLgAG3I1hsAAkYF5GN002GrZpACGp85ksRuICRQSGSs3nUMki
DQGD89tw4WOAUR4gDLP0i70Jo7p5VQcUQuzSdz/mcwrH3ix/3PHDQq/3D88Ekfp4
gVFnhzjZauvTPCE5CWfmGo1rhGap4gsTG38b8NE7gh4FkHD0SPA7N9YlObqnveAC
vLKftVjIOYomkXK+mdSYmDs7rv8scb1XsVXskrsn4T7G8SjhTyE=
=WYBG
-----END PGP SIGNATURE-----

--3MwIy2ne0vdjdPXF--

--===============5269226139608967909==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============5269226139608967909==--
