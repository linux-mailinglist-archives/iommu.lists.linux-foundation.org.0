Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id B412F3C9A3E
	for <lists.iommu@lfdr.de>; Thu, 15 Jul 2021 10:11:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C6996070A;
	Thu, 15 Jul 2021 08:11:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vPH9TfEdTb97; Thu, 15 Jul 2021 08:11:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 9824360B22;
	Thu, 15 Jul 2021 08:11:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 72653C000E;
	Thu, 15 Jul 2021 08:11:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 62F36C000E
 for <iommu@lists.linux-foundation.org>; Thu, 15 Jul 2021 08:11:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F9E183D65
 for <iommu@lists.linux-foundation.org>; Thu, 15 Jul 2021 08:11:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mDEkbjRH4cja for <iommu@lists.linux-foundation.org>;
 Thu, 15 Jul 2021 08:11:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8E49E83D63
 for <iommu@lists.linux-foundation.org>; Thu, 15 Jul 2021 08:11:12 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 97DB02C7; Thu, 15 Jul 2021 10:11:09 +0200 (CEST)
Date: Thu, 15 Jul 2021 10:11:08 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [git pull] IOMMU Fixes for Linux v5.14-rc1
Message-ID: <YO/tnD+7RA32yO1F@8bytes.org>
MIME-Version: 1.0
Cc: iommu@lists.linux-foundation.org, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org
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
Content-Type: multipart/mixed; boundary="===============5632165642608668465=="
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>


--===============5632165642608668465==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HSEOSdXA7rPfQ8+y"
Content-Disposition: inline


--HSEOSdXA7rPfQ8+y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git tags/iommu-fixes-v5.14-rc1

for you to fetch changes up to 4a5c155a5ab372516a1a5ddd29473f8f696feb79:

  MAINTAINERS: Add Suravee Suthikulpanit as Reviewer for AMD IOMMU (AMD-Vi) (2021-07-15 09:00:16 +0200)

----------------------------------------------------------------
IOMMU Fixes for Linux v5.14-rc1

Including:

	- Revert a patch which caused boot failures with QCOM IOMMU

	- Two fixes for Intel VT-d context table handling

	- Physical address decoding fix for Rockchip IOMMU

	- Add a reviewer for AMD IOMMU

----------------------------------------------------------------
Benjamin Gaignard (1):
      iommu/rockchip: Fix physical address decoding

Lu Baolu (1):
      iommu/vt-d: Fix clearing real DMA device's scalable-mode context entries

Marek Szyprowski (1):
      iommu/qcom: Revert "iommu/arm: Cleanup resources in case of probe error path"

Sanjay Kumar (1):
      iommu/vt-d: Global devTLB flush when present context entry changed

Suravee Suthikulpanit (1):
      MAINTAINERS: Add Suravee Suthikulpanit as Reviewer for AMD IOMMU (AMD-Vi)

 MAINTAINERS                             |  1 +
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 13 ++-----------
 drivers/iommu/intel/iommu.c             | 34 ++++++++++++++++++++++-----------
 drivers/iommu/rockchip-iommu.c          |  6 ++++--
 4 files changed, 30 insertions(+), 24 deletions(-)

Please pull.

Thanks,

	Joerg

--HSEOSdXA7rPfQ8+y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEr9jSbILcajRFYWYyK/BELZcBGuMFAmDv7ZwACgkQK/BELZcB
GuP1wg//RVNooucIetYWJ9+/NMIKL8T94ItDABC/S8xJsE1ageX8F45udjdyP5Ig
Jp/V6EQRO9+zvjv5puzWT9ZXjVgHrIU7V4sP4FzKHzv6QQfn2sXFZQVkWFNn/ybP
gbs1Ea2b014g/XS5XVmpx9Dti3h0IOWIg6yHl/oINgUa9St5+9w9fvg8w6LBwH8v
DMJfKbyurdMekHl1cwDm7wXN9cup2q5xraywyUt33ei4QK0vI/RixkLdzkezNVHC
UG9knFWQ83jGlU6ZhouY4528oNN8Yt2+dMB0P4UGg3oD6DHw/SEwHHw/V71dFisn
UxBi+N9V52XQyX7LTEPz8/uz2/VWICeaOn9TYYARZxUVMopADr3ST3OK54oVWSy0
7FuuepXw3ujbxcgnvBKUEmvIjBD+I+sXmSQy91vwgZCBCWgxa1Ki63bIB/CQDqri
Avj1H+6mBuCgjnl5Or2PdkmSwf+BnZ/jP1krBsTPtD1ZrWPdjbBaEr2kt/oBtzu7
HMwp9AcRQnXMYW1XuOE8CSUfAuE+8f9SvB60nFSN5h2Jx50y3ackrIkdFggubyHx
34uPKvd1nufgt4SiRGnaoIFABM4LEd6ksWuGK1SzaFfNm8EgcovU62xhK0MJo1gH
ryvoOBXmOVEzmSEQ3zJ3iHzrOXy8AZSIzZqvcceEGtQegOaBhQg=
=F2tX
-----END PGP SIGNATURE-----

--HSEOSdXA7rPfQ8+y--

--===============5632165642608668465==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============5632165642608668465==--
