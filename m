Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id EE32E1C2C27
	for <lists.iommu@lfdr.de>; Sun,  3 May 2020 14:19:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A5597886EF;
	Sun,  3 May 2020 12:19:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1SilH4EZlSvj; Sun,  3 May 2020 12:19:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7F076886E8;
	Sun,  3 May 2020 12:19:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6FA15C0175;
	Sun,  3 May 2020 12:19:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A941DC0175
 for <iommu@lists.linux-foundation.org>; Sun,  3 May 2020 12:19:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A4E3F87A60
 for <iommu@lists.linux-foundation.org>; Sun,  3 May 2020 12:19:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8fylIBwLJ7cW for <iommu@lists.linux-foundation.org>;
 Sun,  3 May 2020 12:19:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0566587863
 for <iommu@lists.linux-foundation.org>; Sun,  3 May 2020 12:19:39 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id E13FF3A2; Sun,  3 May 2020 14:19:35 +0200 (CEST)
Date: Sun, 3 May 2020 14:19:34 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [git pull] IOMMU Fixes for Linux v5.7-rc3
Message-ID: <20200503121929.GA10425@8bytes.org>
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
Content-Type: multipart/mixed; boundary="===============7936194127449063791=="
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>


--===============7936194127449063791==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Q68bSM7Ycu6FN28Q"
Content-Disposition: inline


--Q68bSM7Ycu6FN28Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

The following changes since commit 6a8b55ed4056ea5559ebe4f6a4b247f627870d4c:

  Linux 5.7-rc3 (2020-04-26 13:51:02 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git tags/iommu-fixes-v5.7-rc3

for you to fetch changes up to b52649aee6243ea661905bdc5fbe28cc5f6dec76:

  iommu/qcom: Fix local_base status check (2020-05-01 13:37:23 +0200)

----------------------------------------------------------------
IOMMU Fixes for Linux v5.7-rc3

Including:

	- Fix for a memory leak when dev_iommu gets freed and a
	  sub-pointer does not.

	- Build dependency fixes for Mediatek, spapr_tce, and
	  Intel IOMMU driver.

	- Export iommu_group_get_for_dev() only for GPLed modules

	- Fix for AMD IOMMU interrupt remapping when x2apic is
	  enabled

	- Fix for error path in the QCOM IOMMU driver probe function

----------------------------------------------------------------
Geert Uytterhoeven (1):
      iommu/mediatek: Fix MTK_IOMMU dependencies

Greg Kroah-Hartman (1):
      iommu: Properly export iommu_group_get_for_dev()

Kevin Hao (1):
      iommu: Fix the memory leak in dev_iommu_free()

Krzysztof Kozlowski (1):
      iommu: spapr_tce: Disable compile testing to fix build on book3s_32 config

Lu Baolu (1):
      iommu/vt-d: Use right Kconfig option name

Suravee Suthikulpanit (1):
      iommu/amd: Fix legacy interrupt remapping for x2APIC-enabled system

Tang Bin (1):
      iommu/qcom: Fix local_base status check

 drivers/iommu/Kconfig          | 4 ++--
 drivers/iommu/amd_iommu_init.c | 2 +-
 drivers/iommu/intel-iommu.c    | 4 ++--
 drivers/iommu/iommu.c          | 3 ++-
 drivers/iommu/qcom_iommu.c     | 5 ++++-
 5 files changed, 11 insertions(+), 7 deletions(-)

Please pull.

There are also some race condition fixes for the AMD IOMMU driver
pending, but I wait for more testing feedback from Qian before sending
them your way, so they are not included here.

Thanks,

	Joerg

--Q68bSM7Ycu6FN28Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEr9jSbILcajRFYWYyK/BELZcBGuMFAl6uttAACgkQK/BELZcB
GuNcNg/9EEptDzjNdWIh4GD+okAC+zWIMeWezt2Te8ytNx/r7zOS1Ye3VqgYq8GS
TavgT+a5hIeaxo2qTLRj7ZNrxVGcB7vshQBwXqBpFg2rYOeo3O+7lhmBeWpGUgBy
6IjyF0WctoUYCkxZPVYjAjoUrSI2ZMzYBpjNKto2EpLFj1f8FAR+Wujcx9l3qWFb
J8G49VIqPhjtHLOGHT1ijmfWaF2MvQmZVpYRsGkRqlaWc//iOrHKc+ONLTApmatP
ZqnqDTqeQNBSEbP0K4G2WZ4N8D3vdBjVrDRb4jQaPpmunK2WHXnSgv/VJy1IyqUT
P4jicSh0vr5YKbkrAeGEj11RLKyji8jrHV2yWBIH8TtHNLagJeyIK5KkNqk+Qz02
g+fUjjiS0Whvxc4zT2r+I+j3MvARZbY2sXRG/3WOUOna6D9HGKLVdQs/7ezDQKES
2LrYSx3G9omTIdwCugJ2jvItokXuryN6wLL87EpnK5iipKWtYnXKoG8Quq/VgJ3+
VI2mvqx4nspJ/ENj22DU++bbNO9KhTKgzrOeOgO8eE8QyUK382MGn5/ehBddK0yD
xnBbTtjEvQPFbAA2rEUrTyZszBE0BhHxQxwNEhmFBVE5CR10BHUseeWdW8HVUI7r
ZdTpE2CMZxR6tM3+hswWH6d5Vg5IeQbz8Amc4CN8DLYU8xQb8wo=
=cYaI
-----END PGP SIGNATURE-----

--Q68bSM7Ycu6FN28Q--

--===============7936194127449063791==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============7936194127449063791==--
