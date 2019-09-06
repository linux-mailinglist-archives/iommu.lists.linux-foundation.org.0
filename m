Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 211D1ABBE9
	for <lists.iommu@lfdr.de>; Fri,  6 Sep 2019 17:12:35 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0B6072346;
	Fri,  6 Sep 2019 15:12:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 505222346
	for <iommu@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 15:12:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id AB4A77DB
	for <iommu@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 15:12:30 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id C25EB2D9; Fri,  6 Sep 2019 17:12:27 +0200 (CEST)
Date: Fri, 6 Sep 2019 17:12:26 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [git pull] IOMMU Fixes for Linux v5.3-rc7
Message-ID: <20190906151220.GA8420@8bytes.org>
MIME-Version: 1.0
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Content-Type: multipart/mixed; boundary="===============3828031454132744870=="
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org


--===============3828031454132744870==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="azLHFNyN32YCQGCU"
Content-Disposition: inline


--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

The following changes since commit a55aa89aab90fae7c815b0551b07be37db359d76:

  Linux 5.3-rc6 (2019-08-25 12:01:23 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git tags/iommu-fixes-v5.3-rc7

for you to fetch changes up to 754265bcab78a9014f0f99cd35e0d610fcd7dfa7:

  iommu/amd: Fix race in increase_address_space() (2019-09-06 10:55:51 +0200)

----------------------------------------------------------------
IOMMU Fixes for Linux v5.3-rc7

Including:

	* Revert for an Intel VT-d patch that caused problems for some
	  users.

	* Removal of a feature in the Intel VT-d driver that was never
	  supported in hardware. This qualifies as a fix because the
	  code for this feature sets reserved bits in the invalidation
	  queue descriptor, causing failed invalidations on real
	  hardware.

	* Two fixes for AMD IOMMU driver to fix a race condition and to
	  add a missing IOTLB flush when kernel is booted in kdump mode.

----------------------------------------------------------------
Jacob Pan (1):
      iommu/vt-d: Remove global page flush support

Joerg Roedel (1):
      iommu/amd: Fix race in increase_address_space()

Lu Baolu (1):
      Revert "iommu/vt-d: Avoid duplicated pci dma alias consideration"

Stuart Hayes (1):
      iommu/amd: Flush old domains in kdump kernel

 drivers/iommu/amd_iommu.c   | 40 ++++++++++++++++++++++++++++-----
 drivers/iommu/intel-iommu.c | 55 +++++++++++++++++++++++++++++++++++++++++++--
 drivers/iommu/intel-svm.c   | 36 +++++++++++++----------------
 include/linux/intel-iommu.h |  3 ---
 4 files changed, 103 insertions(+), 31 deletions(-)

Please pull.

Thanks,

	Joerg

--azLHFNyN32YCQGCU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEr9jSbILcajRFYWYyK/BELZcBGuMFAl1yd1QACgkQK/BELZcB
GuPzJw/9Fovs43Zte02ZZuzwcYPEkErhLi6mwB37Oj0u0MTzPf0zrYn6u0dn320N
xzTEfGYWFRp/PRIfwR5JiJsDU8BvlfCAJZEGp8sAnOTMto2AGG5rgZ4ZxVypK6vm
6bM92eSESQJjseyZTva4IZOF4qeWTgzO7voox84IgWHrWCoem5aS8Y1EVC69+uxa
EOH1TSb3TJLfOf0TKW3aDrftrTbtsvvliOFYLNHoUOx9iOkBzb/0XpL71r6x71dP
n9jNEpxVAJJNuM/oYK9j1UDASHH8Vxdqh0Joy47hhysiBlI9Nnv6rrE06BvVXq0O
ap4PSK9h3fNrDCvpF7G0gGapesieMzJH1Ogu9I1egm3sbD6VJZHz1XK2ynY69y+X
8ZMlPnQu1MDedmYcUj8WixJxTDZO69+nSUhVJF7VG4pmnizKjsjoBDjTpPnv1vwj
E23R4BvStG/44vNPYEps879U5xpjAKrnaq4JwVQD9C5fsiTFlmwcbZrFifllyhae
YpjNMzeifbhx+YQi8mq/4rBgSOZ4rh9qRxaN6iVs9lbN6WQvwMCI23g6Y3onZaIW
+RhJhq6d96yl/CzbUdesk7SWEBxI7INoPpmsKN2Z6+uolIBuRbM3amv4CH4G7IV/
czphzdovKPPmj625crlzchFg+rDOhVWjdcQEmdnBVQXeCTjt48o=
=DD9K
-----END PGP SIGNATURE-----

--azLHFNyN32YCQGCU--

--===============3828031454132744870==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============3828031454132744870==--
