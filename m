Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B665B2DC8BC
	for <lists.iommu@lfdr.de>; Wed, 16 Dec 2020 23:10:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 757F386BEF;
	Wed, 16 Dec 2020 22:10:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GggF1g9erO8f; Wed, 16 Dec 2020 22:10:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7126A86BC4;
	Wed, 16 Dec 2020 22:10:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6427AC013B;
	Wed, 16 Dec 2020 22:10:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DF749C013B
 for <iommu@lists.linux-foundation.org>; Wed, 16 Dec 2020 22:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D3F6986BC4
 for <iommu@lists.linux-foundation.org>; Wed, 16 Dec 2020 22:10:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ak-r-CAr63LM for <iommu@lists.linux-foundation.org>;
 Wed, 16 Dec 2020 22:10:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id CCF3985F61
 for <iommu@lists.linux-foundation.org>; Wed, 16 Dec 2020 22:10:41 +0000 (UTC)
Date: Wed, 16 Dec 2020 22:10:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608156641;
 bh=pMzv+JoqVSavT0fDnRVtzJjQVRMLsgeN6YHxEmEbm34=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=q9uK919gpDoM6Dko6VXEW/KKv29xDOai5/JxFtDZQU1ToV9WqJ/GL48U+UbSjK6a9
 u498mBRX6Ydu6cL0VLZm/zvfO/+MrChUtashGSbMVuuj9NHdB26C2YKtN4bNCCwkwF
 HeK4hqcfusDZfkHRsxuk3JIeL4TlLSlxYB0FL0sDTtNrrgPB3EYKwNiQIoYz4ZDMhU
 pBDwPyAyBB3jg7QFPJn4ofMUCGks8wHFZhYTJJIl59VK8vAmA5w12cYPaaW9yZid5f
 Qp1pBeD8mxs8wiyDhBljbKRk0bzQvp1YCI5AYHjWrSw4qWixLIMRdxzuxxH/R4qNvi
 xfQ2ClrLwS6gw==
From: Will Deacon <will@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [GIT PULL] IOMMU updates for 5.11
Message-ID: <20201216221035.GA16915@willie-the-truck>
References: <20201214234518.GA14575@willie-the-truck>
 <20201216185352.GA16598@willie-the-truck>
 <CAHk-=wijH15u2KfpON3VCECQODAVNJ6DtgQajDaKo+PB_c-L3g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHk-=wijH15u2KfpON3VCECQODAVNJ6DtgQajDaKo+PB_c-L3g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Android Kernel Team <kernel-team@android.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 iommu <iommu@lists.linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>
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

On Wed, Dec 16, 2020 at 02:02:00PM -0800, Linus Torvalds wrote:
> On Wed, Dec 16, 2020 at 10:54 AM Will Deacon <will@kernel.org> wrote:
> >
> > I'm hoping to wind down a bit next week (ho ho ho), so I just wanted to
> > check whether this had got caught in your spam filters, whether you wanted
> > me to change something or whether you're just snowed under in pull requests.
> 
> No, it didn't get lost, and I just merged it. It's just that everybody
> has been very good about sending their pull request early, so I've had
> my hands busy, and I've gone roughly by subsystem (and today got
> around to block drivers and iommus etc).

Brill, cheers. I didn't realise you were going by subsystem, so that's
why I was getting worried.

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
