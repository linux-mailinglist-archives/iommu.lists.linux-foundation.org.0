Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D8868310D89
	for <lists.iommu@lfdr.de>; Fri,  5 Feb 2021 17:02:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6A121872BD;
	Fri,  5 Feb 2021 16:02:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9fH2CJA6pCmI; Fri,  5 Feb 2021 16:02:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C83F0872D0;
	Fri,  5 Feb 2021 16:02:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A951AC013A;
	Fri,  5 Feb 2021 16:02:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C67CEC013A
 for <iommu@lists.linux-foundation.org>; Fri,  5 Feb 2021 16:02:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id AC57E8718B
 for <iommu@lists.linux-foundation.org>; Fri,  5 Feb 2021 16:02:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PkNWm5JetgQo for <iommu@lists.linux-foundation.org>;
 Fri,  5 Feb 2021 16:02:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 8AD3C87277
 for <iommu@lists.linux-foundation.org>; Fri,  5 Feb 2021 16:02:01 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id BFF15387; Fri,  5 Feb 2021 17:01:58 +0100 (CET)
Date: Fri, 5 Feb 2021 17:01:57 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [git pull] IOMMU Fix for Linux v5.11-rc6
Message-ID: <20210205160146.GA28800@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Hi Linus,

The following changes since commit 1048ba83fb1c00cd24172e23e8263972f6b5d9ac:

  Linux 5.11-rc6 (2021-01-31 13:50:09 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git tags/iommu-fixes-v5.11-rc6

for you to fetch changes up to 4c9fb5d9140802db4db9f66c23887f43174e113c:

  iommu: Check dev->iommu in dev_iommu_priv_get() before dereferencing it (2021-02-02 15:57:23 +0100)

----------------------------------------------------------------
IOMMU Fix for Linux v5.11-rc6

	- Fix a possible NULL-ptr dereference in dev_iommu_priv_get()
	  which is too easy to accidentially trigger from IOMMU drivers.
	  In the current case the AMD IOMMU driver triggered it on some
	  machines in the IO-page-fault path, so fix it once and for
	  all.

----------------------------------------------------------------
Joerg Roedel (1):
      iommu: Check dev->iommu in dev_iommu_priv_get() before dereferencing it

 include/linux/iommu.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

Please pull.

Thanks,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
