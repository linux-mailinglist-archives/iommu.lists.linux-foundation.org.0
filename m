Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E451148CFE
	for <lists.iommu@lfdr.de>; Fri, 24 Jan 2020 18:29:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A103187843;
	Fri, 24 Jan 2020 17:29:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bb88kVDjL0LU; Fri, 24 Jan 2020 17:29:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1EDCF8783C;
	Fri, 24 Jan 2020 17:29:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 063A8C1D83;
	Fri, 24 Jan 2020 17:29:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 93ED9C0174
 for <iommu@lists.linux-foundation.org>; Fri, 24 Jan 2020 17:29:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7FDB68783C
 for <iommu@lists.linux-foundation.org>; Fri, 24 Jan 2020 17:29:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CY4ByzjvsuBd for <iommu@lists.linux-foundation.org>;
 Fri, 24 Jan 2020 17:29:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id F089187831
 for <iommu@lists.linux-foundation.org>; Fri, 24 Jan 2020 17:29:48 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 79A5AA52; Fri, 24 Jan 2020 18:29:45 +0100 (CET)
Date: Fri, 24 Jan 2020 18:29:44 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [git pull] IOMMU Fixes for Linux v5.5-rc7
Message-ID: <20200124172938.GA30565@8bytes.org>
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
Content-Type: multipart/mixed; boundary="===============1094023603891840049=="
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>


--===============1094023603891840049==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="G4iJoqBmSsgzjUCe"
Content-Disposition: inline


--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

The following changes since commit def9d2780727cec3313ed3522d0123158d87224d:

  Linux 5.5-rc7 (2020-01-19 16:02:49 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git tags/iommu-fixes-v5.5-rc7

for you to fetch changes up to 8c17bbf6c8f70058a66305f2e1982552e6ea7f47:

  iommu/amd: Fix IOMMU perf counter clobbering during init (2020-01-24 15:28:40 +0100)

----------------------------------------------------------------
IOMMU Fixes for Linux v5.5-rc7

Two Fixes:

	- Fix NULL-ptr dereference bug in Intel IOMMU driver

	- Properly safe and restore AMD IOMMU performance counter
	  registers when testing if they are writable.

----------------------------------------------------------------
Jerry Snitselaar (1):
      iommu/vt-d: Call __dmar_remove_one_dev_info with valid pointer

Shuah Khan (1):
      iommu/amd: Fix IOMMU perf counter clobbering during init

 drivers/iommu/amd_iommu_init.c | 24 ++++++++++++++++++------
 drivers/iommu/intel-iommu.c    |  3 ++-
 2 files changed, 20 insertions(+), 7 deletions(-)

Please pull.

Thanks,

	Joerg

--G4iJoqBmSsgzjUCe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEr9jSbILcajRFYWYyK/BELZcBGuMFAl4rKYEACgkQK/BELZcB
GuNdkhAAlRLkHjoXT38iYdfMCBUggHmc7U5H/GiIADORG9kD/CoKDwmvtmpqRfk/
Kta1udCotWFtBGyWm77mglk2cdxlHAyfsN+Prmy+4acFCBu/7dgu/KvgaYWcZiz+
UGNuHP8D9LvXIupkEI3w4xszR63TBPU8ptwQti0yyXb11zpyUFu8WdJgOjE/ejDM
CqABUbgYy5ZGnWmU3mmNF7uU895199jRCy74PWJ8fyulhwlIeXVRGviseF7Lhumr
SULq7PGXVWrLQ4BxWXHQZ+bTA7ZtOntj80DH5pLXkQYEWYbF46Tk4o+7swsdcRvj
+EFdDxrLkgVtuRWXGQ9e1LcK/hpWTuoWcZZiAEskmGuQfCASuK9v0a0Z7tOa3VYO
ewVzn7fQFP4jM/6Vj4ulqw34+xTWnZ77W7LCgCYxAc/mVSSaWu5ieR7uqtTBFRpv
IC6w95gQaUwMYnh42UN+5TLRWVrGxZVQ2daCsoqu0m4H0N1B2sXyJOK9AuAMDteN
FxDQJc+YBPfVCB5mnHopU604uzVTXJ8goXudo4kAz3B45JvCngCa5pPUYfWMsf1j
0XdVy9uDw17mRTX85gv5AjwbyIM2exowxbaGI6+3Y3m853WZN1tHIkV5dF/ulT+M
M3GgWktVnd5J8BfJgvaKvncxVRWL/mCymNYi2YUQD/yCBp01r1o=
=DFl+
-----END PGP SIGNATURE-----

--G4iJoqBmSsgzjUCe--

--===============1094023603891840049==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============1094023603891840049==--
