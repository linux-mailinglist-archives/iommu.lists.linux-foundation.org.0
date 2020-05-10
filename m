Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 510C61CCAFF
	for <lists.iommu@lfdr.de>; Sun, 10 May 2020 14:26:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E102087601;
	Sun, 10 May 2020 12:26:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id knSstVH30zot; Sun, 10 May 2020 12:26:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id AB79F8763C;
	Sun, 10 May 2020 12:26:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A016BC016F;
	Sun, 10 May 2020 12:26:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5307AC016F
 for <iommu@lists.linux-foundation.org>; Sun, 10 May 2020 12:26:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3B26D86227
 for <iommu@lists.linux-foundation.org>; Sun, 10 May 2020 12:26:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2nXk7j1kpEAj for <iommu@lists.linux-foundation.org>;
 Sun, 10 May 2020 12:26:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9069C86222
 for <iommu@lists.linux-foundation.org>; Sun, 10 May 2020 12:26:46 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 56BAB366; Sun, 10 May 2020 14:26:41 +0200 (CEST)
Date: Sun, 10 May 2020 14:26:40 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [git pull] IOMMU Fixes for Linux v5.7-rc4
Message-ID: <20200510122634.GA32616@8bytes.org>
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
Content-Type: multipart/mixed; boundary="===============0534640502516377944=="
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>


--===============0534640502516377944==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sdtB3X0nJg68CQEu"
Content-Disposition: inline


--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

The following changes since commit 0e698dfa282211e414076f9dc7e83c1c288314fd:

  Linux 5.7-rc4 (2020-05-03 14:56:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git tags/iommu-fixes-v5.7-rc4

for you to fetch changes up to fb3637a113349f53830f7d6ca45891b7192cd28f:

  iommu/virtio: Reverse arguments to list_add (2020-05-08 17:31:18 +0200)

----------------------------------------------------------------
IOMMU Fixes for Linux v5.7-rc4

Including:

	- The race condition fixes for the AMD IOMMU driver. This are 5
	  patches fixing two race conditions around
	  increase_address_space(). The first race condition was around
	  the non-atomic update of the domain page-table root pointer
	  and the variable containing the page-table depth (called
	  mode). This is fixed now be merging page-table root and mode
	  into one 64-bit field which is read/written atomically.

	  The second race condition was around updating the page-table
	  root pointer and making it public before the hardware caches
	  were flushed. This could cause addresses to be mapped and
	  returned to drivers which are not reachable by IOMMU hardware
	  yet, causing IO page-faults. This is fixed too by adding the
	  necessary flushes before a new page-table root is published.

	  Related to the race condition fixes these patches also add a
	  missing domain_flush_complete() barrier to update_domain() and
	  a fix to bail out of the loop which tries to increase the
	  address space when the call to increase_address_space() fails.

	  Qian was able to trigger the race conditions under high load
	  and memory pressure within a few days of testing. He confirmed
	  that he has seen no issues anymore with the fixes included
	  here.

	- Fix for a list-handling bug in the VirtIO IOMMU driver.

----------------------------------------------------------------
Joerg Roedel (5):
      iommu/amd: Fix race in increase_address_space()/fetch_pte()
      iommu/amd: Do not loop forever when trying to increase address space
      iommu/amd: Call domain_flush_complete() in update_domain()
      iommu/amd: Update Device Table in increase_address_space()
      iommu/amd: Do not flush Device Table in iommu_map_page()

Julia Lawall (1):
      iommu/virtio: Reverse arguments to list_add

 drivers/iommu/amd_iommu.c       | 198 +++++++++++++++++++++++++++++++---------
 drivers/iommu/amd_iommu_types.h |   9 +-
 drivers/iommu/virtio-iommu.c    |   2 +-
 3 files changed, 162 insertions(+), 47 deletions(-)

Please pull.

Thanks,

	Joerg

--sdtB3X0nJg68CQEu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEr9jSbILcajRFYWYyK/BELZcBGuMFAl638voACgkQK/BELZcB
GuO7WxAAv1h6eqomWyx9rR1/ULA1jp9R6enGO23hy1nx8Y/5oyEke/vB2j5Hyhjz
b+nFElKWztVuHJnoFzl3NQZG1wKfrUZmrQpoRQOoZ3cL/ouncobiUYB1+a8AUl+P
ABKMGo3isJeMjaED2n7yewhL1mNbrk7BeuyhSytjmHwLfQsiWQChg3zFwPnB7bjg
SuuNe1aZodCyo9YA+eAHtnmWAAimAwZiMcnDzlQaBHPoyR6R3k49XLACaen0mqYw
o/Ldk4YQPXq9HcU7r7C0OzxJ2VJ2iRxRwEX8XqKTa0J+yilrJA6IMmhBz35FesDI
4ZCWsk+7LbzvTOFd+5pw8vmQmuiH4vSKol6NgtwZHNjsYYQ49WCSxak7L/ILGmvT
OmCA0InIZbsm8eQ2TwK1s91Vd6NKw53ZY2XiSVOVcxSXzmUjyroS+lCbA2Gq+QST
1hXIBV3v6itAIQ0yoWSVpnpGswmhPWjaUctEPZZYHgWnOWhlcOxRAfop+/EhB3k9
IaT6GwFPMsm5n/ZGVe+EuOHRnxJ8gqHaY1AKaQPVNpBppGXsmZPo+raSKJXqcU7k
z8VVKKKXCds3E7JrMNohur7tBdyigbQ7R9fOpmccILParuYhjX7EtO8ZLMQ8DDoA
XHXYGdbxzaewlQWHJuY6Lfw09M7v+VvMa3zeXda7W6eXfHV4JQ8=
=QKO+
-----END PGP SIGNATURE-----

--sdtB3X0nJg68CQEu--

--===============0534640502516377944==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============0534640502516377944==--
