Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A77B71385BF
	for <lists.iommu@lfdr.de>; Sun, 12 Jan 2020 10:59:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 29E7A87568;
	Sun, 12 Jan 2020 09:59:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SvNcvGm8QB4i; Sun, 12 Jan 2020 09:59:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5E68887554;
	Sun, 12 Jan 2020 09:59:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 31D8BC077D;
	Sun, 12 Jan 2020 09:59:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E33E7C077D
 for <iommu@lists.linux-foundation.org>; Sun, 12 Jan 2020 09:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id CC3EA848A0
 for <iommu@lists.linux-foundation.org>; Sun, 12 Jan 2020 09:59:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yAFDWLHCEtAR for <iommu@lists.linux-foundation.org>;
 Sun, 12 Jan 2020 09:59:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 618578488E
 for <iommu@lists.linux-foundation.org>; Sun, 12 Jan 2020 09:59:47 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 0116D3AA; Sun, 12 Jan 2020 10:59:42 +0100 (CET)
Date: Sun, 12 Jan 2020 10:59:41 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [git pull] IOMMU Fixes for Linux v5.5-rc5
Message-ID: <20200112095936.GA17108@8bytes.org>
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
Content-Type: multipart/mixed; boundary="===============5457371215018078965=="
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>


--===============5457371215018078965==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IJpNTDwzlM2Ie8A6"
Content-Disposition: inline


--IJpNTDwzlM2Ie8A6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

The following changes since commit c79f46a282390e0f5b306007bf7b11a46d529538:

  Linux 5.5-rc5 (2020-01-05 14:23:27 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git iommu-fixes-v5.5-rc5

for you to fetch changes up to 55817b340a31951d23d1692db45522560b1d20f9:

  iommu/dma: fix variable 'cookie' set but not used (2020-01-07 17:08:58 +0100)

----------------------------------------------------------------
IOMMU Fixes for Linux v5.5-rc5

Including:

	- Two fixes for VT-d and generic IOMMU code to fix teardown on
	  error handling code paths.

	- Patch for the Intel VT-d driver to fix handling of non-PCI
	  devices

	- Fix W=1 compile warning in dma-iommu code

----------------------------------------------------------------
Jon Derrick (2):
      iommu: Remove device link to group on failure
      iommu/vt-d: Unlink device if failed to add to group

Patrick Steinhardt (1):
      iommu/vt-d: Fix adding non-PCI devices to Intel IOMMU

Qian Cai (1):
      iommu/dma: fix variable 'cookie' set but not used

 drivers/iommu/dma-iommu.c   |  3 ---
 drivers/iommu/intel-iommu.c | 22 ++++++++++++++++++----
 drivers/iommu/iommu.c       |  1 +
 3 files changed, 19 insertions(+), 7 deletions(-)

Please pull.

Thanks,

	Joerg

--IJpNTDwzlM2Ie8A6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEr9jSbILcajRFYWYyK/BELZcBGuMFAl4a7ggACgkQK/BELZcB
GuO5JA/+Je/0TqClzmUhSe6RXC4s+fHx9kvT+ZDcQH6LPbh8zgUfSwIs2WnrqpJZ
gIsdrLNehRv8PYin8AJg14ZxzQ/SOuJC7vf0NybVRGq5fsDPbEPh9T6k6bf7czzF
Z0lMrby3qt1NHHsjRJHKmnPStgYuchwFvJy8JK/dZ0gmQsU79m5kVKdqtAVntIDg
DDdaXBQCUa+jlZi9ndgkQklm2zaxdBVCkSEEfFjBHOOSMJJAce3wjDTEfQBSurZs
NU7Nw0dR7Nq2YZJGTIAMj5RKWH6N3Cn9NUnL6stsKXOo5ivJPLaUEVBncXQLLjuL
Yp4USo1hPhKCPCJzemGljcU7PN1ALlvNW6KFzy6eFEAlZ7k9vHWKejbGDj3hkBu8
eM4Ia9h4rAyLellqI06+KOWZK9liikCo7n9bzI8+jvzsWUo/GuIJ9cWm4IEtlDpW
DS+dyqldqW9K3ykK2q9w3CY6u3dQTLb0cIhNlePBQ+Y6u/cHpmfn2DMccPRXnLy2
+uiUsk+et9IXbGRhqc9n0XLoBO7KXWdkDlNXBwmYFwHx9+vASwgmyUI7TjUHS5M3
5+SEra0BmsE9M3DoZgXWGyr1qZypb+LveXooDF5aeE4DJ00XS7dkELe9p1hNL/fk
S7dcK7IJJDlX5kmoq/iXYdxBYhK7ncvsiQvUvNV4QM07l2FN2Oc=
=2L+s
-----END PGP SIGNATURE-----

--IJpNTDwzlM2Ie8A6--

--===============5457371215018078965==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============5457371215018078965==--
