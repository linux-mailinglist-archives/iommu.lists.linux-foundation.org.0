Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F93141F1B2
	for <lists.iommu@lfdr.de>; Fri,  1 Oct 2021 18:01:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7985844DF;
	Fri,  1 Oct 2021 16:01:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S60XYldoXnS4; Fri,  1 Oct 2021 16:01:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 0D9C0844E7;
	Fri,  1 Oct 2021 16:01:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D520FC000D;
	Fri,  1 Oct 2021 16:01:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 56DE1C000D
 for <iommu@lists.linux-foundation.org>; Fri,  1 Oct 2021 16:01:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 41998407DA
 for <iommu@lists.linux-foundation.org>; Fri,  1 Oct 2021 16:01:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EFGx3NYmUMQ1 for <iommu@lists.linux-foundation.org>;
 Fri,  1 Oct 2021 16:01:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 65883407D8
 for <iommu@lists.linux-foundation.org>; Fri,  1 Oct 2021 16:01:45 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id B142C25C; Fri,  1 Oct 2021 18:01:41 +0200 (CEST)
Date: Fri, 1 Oct 2021 18:01:38 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [git pull] IOMMU Fixes for Linux v5.15-rc3
Message-ID: <YVcw4sXKg6alXhmx@8bytes.org>
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
Content-Type: multipart/mixed; boundary="===============8015842121584627855=="
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>


--===============8015842121584627855==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BAeRcwq0YWaKgDX+"
Content-Disposition: inline


--BAeRcwq0YWaKgDX+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

The following changes since commit 5816b3e6577eaa676ceb00a848f0fd65fe2adc29:

  Linux 5.15-rc3 (2021-09-26 14:08:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git tags/iommu-fixes-v5.15-rc3

for you to fetch changes up to f0b636804c7c4c564efbca5981e3c56b5c6fe0c5:

  iommu/dart: Clear sid2group entry when a group is freed (2021-09-28 11:47:24 +0200)

----------------------------------------------------------------
IOMMU Fixes for Linux v5.15-rc3

Including:

	- Two fixes for the new Apple DART driver to fix a kernel panic
	  and a stale data usage issue

	- Intel VT-d fix for how PCI device ids are printed

----------------------------------------------------------------
Bjorn Helgaas (1):
      iommu/vt-d: Drop "0x" prefix from PCI bus & device addresses

Sven Peter (2):
      iommu/dart: Remove iommu_flush_ops
      iommu/dart: Clear sid2group entry when a group is freed

 drivers/iommu/apple-dart.c | 56 +++++++++++++++++++++++++++++-----------------
 drivers/iommu/intel/dmar.c |  6 ++---
 2 files changed, 38 insertions(+), 24 deletions(-)

Please pull.

Thanks,

	Joerg

--BAeRcwq0YWaKgDX+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEr9jSbILcajRFYWYyK/BELZcBGuMFAmFXMOIACgkQK/BELZcB
GuNnEQ//UWvxSNWNVy7EYhUIMEMXXb8Qf+CUgNaCfQzzwLKAZv/hsQdfGJjF5NFC
0aLw3Of0RFq04R16Vss9gFuPcpse7/GAtFxg74IZaWTCN3nAUrMXcew3nT2PVuPU
MS21f4O854aKgq3uXn4C6wO7LgwpbZrVBrijJ+xK/URWgFuvpT8w5yhPoRiP0S5M
XnVkJ91403W5plUvpcA84RbxGVUo75ozmAlvmPRQRf0LcacWtYyfuwSCDQepTZHr
FUglbNip6BUDdga1gR4UegDaQISyfy6wPmAKXYOa2R9cDXqJcOcj0BY6ZucDTUAg
T/TsZZD87T4mM4pbc/83Z8XP9/+gxmOqPgcdCqU0DtQA8bQJVENLQ88LfsulhKDA
GbX7vN2xu2slssZelHzEn2L1FZ5bdjpXrodtJRQbCF6I7ZSp1VrsmlG36INpLFs5
3uIphwy8him8ah9FhF+LpgAzK8qIkwWywbB+gmdjOOo+fxSTqMbsejpF8OfGwDrO
3954YCic++oq5zt+RZix+55fcmwBfchnxumzeyYApMuoWhAxLBNXncyew9YoHlXy
izcFNjJ9LiNm6H++EI9mjHdsd/M7S6iMC9SaRuIKsnizmq7cPRrTqn9eobUpJiX3
IWRoGf+sU2oZczZdulSuV2qsqSqJ+jfmDlXEaLHeFCUPu44Kfp0=
=69i1
-----END PGP SIGNATURE-----

--BAeRcwq0YWaKgDX+--

--===============8015842121584627855==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============8015842121584627855==--
