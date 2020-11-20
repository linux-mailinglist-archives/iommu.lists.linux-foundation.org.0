Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A992C2BA98F
	for <lists.iommu@lfdr.de>; Fri, 20 Nov 2020 12:50:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6296D86DE7;
	Fri, 20 Nov 2020 11:50:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RCz0Cs33x_tR; Fri, 20 Nov 2020 11:50:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E88B286DE6;
	Fri, 20 Nov 2020 11:50:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C8D6FC0891;
	Fri, 20 Nov 2020 11:50:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 72F8BC0891
 for <iommu@lists.linux-foundation.org>; Fri, 20 Nov 2020 11:50:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5EB7F87599
 for <iommu@lists.linux-foundation.org>; Fri, 20 Nov 2020 11:50:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4fk0RP-JWcWM for <iommu@lists.linux-foundation.org>;
 Fri, 20 Nov 2020 11:50:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DC65587590
 for <iommu@lists.linux-foundation.org>; Fri, 20 Nov 2020 11:50:40 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B814422253;
 Fri, 20 Nov 2020 11:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605873040;
 bh=ea4nW8m0igZipC/exKVzNA25UDfEbUhPnBl6fApkIiA=;
 h=Date:From:To:Cc:Subject:From;
 b=fgnex9fZNYd4RsdG05/19EG//wUcJ+LuTxh+Aq76dXYVc0K2nxAIRplSLXyrfOM5s
 14G263Hg3zeB/tM1LclLlz0+XOHNvDGwdsuJ3588EO3viweTQPd25BBBsC/J+XNPvs
 ikl1FFZvGmUvcvjSFUH55adVwCN0JgdgYdUfYHlg=
Date: Fri, 20 Nov 2020 11:50:35 +0000
From: Will Deacon <will@kernel.org>
To: torvalds@linux-foundation.org
Subject: [GIT PULL] IOMMU fixes for -rc5
Message-ID: <20201120115034.GA6386@willie-the-truck>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 Alex Williamson <alex.williamson@redhat.com>, tglx@linutronix.de,
 Robin Murphy <robin.murphy@arm.com>
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

As mentioned at [1], I'm temporarily helping out with the IOMMU tree so
here are some fixes I've collected for -rc5, including an update to
MAINTAINERS as suggested by Joerg on IRC.

Anyway, two straightforward vt-d fixes summarised in the tag. I ended up
pulling in some x86 fixes from tip which you already merged for -rc4, as
the DMAR build failure was introduced there and so I needed that in order
to apply the fix.

Please pull.

Cheers,

Will

[1] https://lore.kernel.org/lkml/20201117100953.GR22888@8bytes.org/

--->8

The following changes since commit ff828729be446b86957f7c294068758231cd2183:

  iommu/vt-d: Cure VF irqdomain hickup (2020-11-13 12:00:40 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/iommu-fixes

for you to fetch changes up to 91c2c28d8de34815ea9bb4d16e9db7308ad33d3e:

  MAINTAINERS: Temporarily add myself to the IOMMU entry (2020-11-19 11:12:17 +0000)

----------------------------------------------------------------
iommu fixes for -rc5

- Fix boot when intel iommu initialisation fails under TXT (tboot)

- Fix intel iommu compilation error when DMAR is enabled without ATS

- Temporarily update IOMMU MAINTAINERs entry

----------------------------------------------------------------
Lu Baolu (1):
      iommu/vt-d: Fix compile error with CONFIG_PCI_ATS not set

Will Deacon (2):
      Merge tag 'x86-urgent-2020-11-15' of git://git.kernel.org/.../tip/tip into for-next/iommu/fixes
      MAINTAINERS: Temporarily add myself to the IOMMU entry

Zhenzhong Duan (1):
      iommu/vt-d: Avoid panic if iommu init fails in tboot system

 MAINTAINERS                 | 1 +
 arch/x86/kernel/tboot.c     | 3 ---
 drivers/iommu/intel/dmar.c  | 4 +++-
 drivers/iommu/intel/iommu.c | 5 +++--
 include/linux/intel-iommu.h | 1 -
 5 files changed, 7 insertions(+), 7 deletions(-)
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
