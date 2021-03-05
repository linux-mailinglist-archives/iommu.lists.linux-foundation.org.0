Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8E232EFF6
	for <lists.iommu@lfdr.de>; Fri,  5 Mar 2021 17:23:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E12FB8452E;
	Fri,  5 Mar 2021 16:23:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AeIUTDSpA0lB; Fri,  5 Mar 2021 16:23:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE21D84520;
	Fri,  5 Mar 2021 16:23:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B3463C0010;
	Fri,  5 Mar 2021 16:23:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 81592C0001
 for <iommu@lists.linux-foundation.org>; Fri,  5 Mar 2021 16:23:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B8C94ED2F
 for <iommu@lists.linux-foundation.org>; Fri,  5 Mar 2021 16:23:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QwSkilD23KLA for <iommu@lists.linux-foundation.org>;
 Fri,  5 Mar 2021 16:23:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BA8654ED2C
 for <iommu@lists.linux-foundation.org>; Fri,  5 Mar 2021 16:23:29 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id CEDC947C; Fri,  5 Mar 2021 17:23:25 +0100 (CET)
Date: Fri, 5 Mar 2021 17:23:24 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [git pull] IOMMU Fixes for Linux iommu-updates-v5.12
Message-ID: <20210305162319.GA14489@8bytes.org>
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
Content-Type: multipart/mixed; boundary="===============1748282185008780536=="
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>


--===============1748282185008780536==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GvXjxJ+pjyke8COw"
Content-Disposition: inline


--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

The following changes since commit 45e606f2726926b04094e1c9bf809bca4884c57f:

  Merge branches 'arm/renesas', 'arm/smmu', 'x86/amd', 'x86/vt-d' and 'core' into next (2021-02-12 15:27:17 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git tags/iommu-fixes-v5.12-rc1

for you to fetch changes up to 444d66a23c1f1e4c4d12aed4812681d0ad835d60:

  iommu/vt-d: Fix status code for Allocate/Free PASID command (2021-03-04 13:32:04 +0100)

----------------------------------------------------------------
IOMMU Fixes for Linux v5.12-rc1

Including:

	- Fix for a sleeping-while-atomic issue in the AMD IOMMU code

	- Disabling lazy IOTLB flush for untrusted devices in the Intel VT-d driver

	- Fix status code definitions for Intel VT-d

	- Fix IO Page Fault issue in Tegra IOMMU driver

----------------------------------------------------------------
Andrey Ryabinin (1):
      iommu/amd: Fix sleeping in atomic in increase_address_space()

Lu Baolu (1):
      iommu: Don't use lazy flush for untrusted device

Nicolin Chen (1):
      iommu/tegra-smmu: Fix mc errors on tegra124-nyan

Zenghui Yu (1):
      iommu/vt-d: Fix status code for Allocate/Free PASID command

 drivers/iommu/amd/io_pgtable.c | 10 +++---
 drivers/iommu/dma-iommu.c      | 15 +++++----
 drivers/iommu/intel/pasid.h    |  4 +--
 drivers/iommu/tegra-smmu.c     | 72 +++++++++++++++++++++++++++++++++++++++++-
 4 files changed, 87 insertions(+), 14 deletions(-)

Please pull.

Thanks,

	Joerg

--GvXjxJ+pjyke8COw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEr9jSbILcajRFYWYyK/BELZcBGuMFAmBCWvYACgkQK/BELZcB
GuNZ7Q/+KqbPG4VldrL3+whXokC0q+DaLATCaWJln2vjzUEqoJEf5T1YbEki+GzJ
T4hzfEjjQgqX4NyZY2dXELkbuclkeZJKXxTb72Dcnsqf8y8xo33PHVw0B10nE5mR
qi3SNrETGtykcx5hJKMZnHVVm7hJGRlTwKtzKKV4Rfl0TQnQ2IibqmDexeoUWXlz
tNK48glmGs3wcfjdRlPABCEFTqQoODllaZ9rgCiQMqegPR4dVyEFhhOJ3ATgAcCt
OYDnXyoUcdhWhmTCYosQlAlrRQ5X0VZ7voRMoAv2ZTHTjRvmvwIIPAnV5M6w3CtW
iGPzN7JwEULwPUgJajcj8Qda/kR41K1fXUdJO+LLKAnekU1W6xfCIsJRNAIcU2IB
2qZuJdcnZhkh4TN8UoQdQLZvT1YEshKpT7FdcY0LyDIsdp8KcHIeNfjx5crYC6IT
5uvlRfEV3vkqm2sZO+qAtxCxM9iRKkkWUCC1IqSLzQ2Dri+5b02fKkEqd5hIgn5I
qZOem3Sb29gpjcoKCV8tdgiiXeZ302rFB+Xkvl3VF4jb5DlwHkuTSkWM47dlD/L9
9WZSQzPWi09NWahHulPQEpYueppEhlJlzu9XXWoRWNSO6O80y3ROyx/Ag5t2gzYb
ILuS47fCLwUD8518MAVXD4MrhMzL4pbYVyvLVBykOnZKFztRoAo=
=UIv1
-----END PGP SIGNATURE-----

--GvXjxJ+pjyke8COw--

--===============1748282185008780536==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============1748282185008780536==--
