Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FD7292AB2
	for <lists.iommu@lfdr.de>; Mon, 19 Oct 2020 17:44:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 618E12D946;
	Mon, 19 Oct 2020 15:44:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DmflFQgB7VoV; Mon, 19 Oct 2020 15:44:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id AB4E320347;
	Mon, 19 Oct 2020 15:44:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8D7D1C0051;
	Mon, 19 Oct 2020 15:44:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 22FD2C0051
 for <iommu@lists.linux-foundation.org>; Mon, 19 Oct 2020 15:44:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1EBF687614
 for <iommu@lists.linux-foundation.org>; Mon, 19 Oct 2020 15:44:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O+ySk+FlMNP7 for <iommu@lists.linux-foundation.org>;
 Mon, 19 Oct 2020 15:44:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B14B387609
 for <iommu@lists.linux-foundation.org>; Mon, 19 Oct 2020 15:44:27 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 8F2554C3; Mon, 19 Oct 2020 17:44:24 +0200 (CEST)
Date: Mon, 19 Oct 2020 17:44:23 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [git pull] IOMMU Fixes for Linux since iommu-updates-v5.10
Message-ID: <20201019154418.GA25261@8bytes.org>
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
Content-Type: multipart/mixed; boundary="===============4618964236751200281=="
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>


--===============4618964236751200281==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AhhlLboLdkugWU4S"
Content-Disposition: inline


--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

The following changes since commit 7e3c3883c381aeda903778d7e99fc4cd523be610:

  Merge branches 'arm/allwinner', 'arm/mediatek', 'arm/renesas', 'arm/tegra', 'arm/qcom', 'arm/smmu', 'ppc/pamu', 'x86/amd', 'x86/vt-d' and 'core' into next (2020-10-07 11:51:59 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git tags/iommu-fix-v5.10

for you to fetch changes up to 9def3b1a07c41e21c68a0eb353e3e569fdd1d2b1:

  iommu/vt-d: Don't dereference iommu_device if IOMMU_API is not built (2020-10-19 14:16:02 +0200)

----------------------------------------------------------------
IOMMU Fix for Linux v5.10:

	- Fix a build regression with !CONFIG_IOMMU_API

----------------------------------------------------------------
Bartosz Golaszewski (1):
      iommu/vt-d: Don't dereference iommu_device if IOMMU_API is not built

 drivers/iommu/intel/dmar.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Please pull.

Thanks,

	Joerg

--AhhlLboLdkugWU4S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEr9jSbILcajRFYWYyK/BELZcBGuMFAl+NtFIACgkQK/BELZcB
GuN+1g/5AQencd67ugSp9xsZdB7mnHk0zO/8tfyxx0PWsX1/QrWbs8vVs8xzHGhA
1WbLXLzTJwlbJWy0+np26U3/B6Y3AhP3ugBmdu5UMC87Zeyi3aXNhMCaLoTAkCnu
KKiTCMQDXY1E7T8ocUExgBtCO8M3NAlWCAgBHDMcI9SAeYbsIpGT/lVyloGPEoMk
tyGJNKa5msxUhXPiDps3UgPrMgBy0ghDwcr2ErURXOQZdL7wa+fWPPkTaF5KSzS7
+ASBNwALqOECQe6bmOhQ9OGiVlvgA3RkLl7Ep4DdcaUGc6nAseYsFD4LLDEnWAPe
Uvhjyrbs9iyhCRxVG77s+fyyPt0ppEis/gIqjD0mbh1NvGRJc//davvB2FtR/fiA
JcrAb9zj6QjOYcaCtRUQUjALe5hXe0N32vHygNwDapQdg80d4W2nL95vFbDg1s8t
EGFWVoCfD4oc2hQIG/AOpzlaR/g6Mlg+guaaC7wZtn103yVtJMphTYoiwdcrSJYx
EtWWSAq02L4+lyHp3h2tUW4MMEeUggtC5B+F7WbkA7M6mh0y1oNCm9DfK5RVbn6i
aJTaCEwg/wgwnk+AiUttO+DoNXR8EZPPc0isnMdIOj2EYTtOwNi9JkTRFZ+eFvAN
LlcqpmOkJ3RpvRjFO5K8qrnEfHPjs7xAHSYSUSq8DjNMFX6WfdA=
=FsUY
-----END PGP SIGNATURE-----

--AhhlLboLdkugWU4S--

--===============4618964236751200281==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============4618964236751200281==--
