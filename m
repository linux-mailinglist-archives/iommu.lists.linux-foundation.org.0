Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD8122CDC1
	for <lists.iommu@lfdr.de>; Fri, 24 Jul 2020 20:27:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3AD4D87111;
	Fri, 24 Jul 2020 18:27:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s5QSRVhSl8Wv; Fri, 24 Jul 2020 18:27:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CA4B4870D6;
	Fri, 24 Jul 2020 18:27:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A1454C0052;
	Fri, 24 Jul 2020 18:27:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1367AC004C
 for <iommu@lists.linux-foundation.org>; Fri, 24 Jul 2020 18:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9470F870D6
 for <iommu@lists.linux-foundation.org>; Fri, 24 Jul 2020 18:26:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MKNVpgX6U6_J for <iommu@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 18:26:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C58C1870A5
 for <iommu@lists.linux-foundation.org>; Fri, 24 Jul 2020 18:26:48 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id CD9F06FA; Fri, 24 Jul 2020 20:26:45 +0200 (CEST)
Date: Fri, 24 Jul 2020 20:26:44 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [git pull] IOMMU Fix for Linux v5.8-rc6
Message-ID: <20200724182640.GA12653@8bytes.org>
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
Content-Type: multipart/mixed; boundary="===============0518864521552651818=="
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>


--===============0518864521552651818==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Content-Disposition: inline


--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

The following changes since commit ba47d845d715a010f7b51f6f89bae32845e6acb7:

  Linux 5.8-rc6 (2020-07-19 15:41:18 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git tags/iommu-fix-v5.8-rc6

for you to fetch changes up to 1014a2f8d76b05e0f228dd097ac1a249c5934232:

  iommu/qcom: Use domain rather than dev as tlb cookie (2020-07-22 17:29:28 +0200)

----------------------------------------------------------------
IOMMU Fix for Linux v5.8-rc6

One fix:

	- Fix a NULL-ptr dereference in the QCOM IOMMU driver

----------------------------------------------------------------
Rob Clark (1):
      iommu/qcom: Use domain rather than dev as tlb cookie

 drivers/iommu/qcom_iommu.c | 37 +++++++++++++++++--------------------
 1 file changed, 17 insertions(+), 20 deletions(-)

Please pull.

Thanks,

	Joerg

--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEr9jSbILcajRFYWYyK/BELZcBGuMFAl8bJ+AACgkQK/BELZcB
GuN4Ag/+LYRNBjDTSFdYRBeAApKWrAu7yMICB26qTPb1nsSxRVMmu0vZxNUlaJBF
nsHFnPSRRtZj6b5psvn5tQYFZsG4fjUHAvH9b7eRgtmmRhR09ghi07nEbO3jUCDB
lpm2hhDtbeixcxOrKqD6bdkquPtMvzIqMaG0qXuWgEvBcHmxtFLnZ2SKeNxudMlO
IMXetLjKtxLIhnQ1od3mCtkgLBWf5GgaD5CO6+jJ5rgiYYG2DkeTcKTWU0gM/bhS
5ylCJHk7rOqF7Q7a2PFGOz67hLfD539JoeiZTBLo3KVqx2F30imRKDyaLkh5q3gD
ckgSpGvMETOySacW/Cm3bYr9f7688eGAw+i7fp/GwkaBAf+46dZATk2wNC3i4sth
3ZaNmBygfL+Xz3cnsnk81xx3uMjl+qsvlVJMxG3XQron1ypt741vwb7V69hBtT1T
1Je0ykxlpu5HTJFudN3P1qjLM/8WSdjDxjfpLHeoICnLujoRNQmSKS30l1X5uhAx
7rYllOoWJnGK7J3CQzDIGNnHrqb7qPwyX6vVhij2thPxJnmPy0h13Dqr/hGquC7j
w1AjI54LIPHCPeW3U13pccratpuccf3hZW3oJyA5GSzCJGp2k6zWeGVclElxCt3j
eLSIw5rOgRxqWNdxWQZFwmbY26+IOJdvAddgeKhdjb+ykLTkRwE=
=/4zN
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--

--===============0518864521552651818==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============0518864521552651818==--
