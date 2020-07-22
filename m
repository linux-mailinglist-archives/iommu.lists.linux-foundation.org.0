Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AC9229B9F
	for <lists.iommu@lfdr.de>; Wed, 22 Jul 2020 17:39:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BA7C986A94;
	Wed, 22 Jul 2020 15:39:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h3_WS3GnCM-L; Wed, 22 Jul 2020 15:39:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 280AC86A32;
	Wed, 22 Jul 2020 15:39:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 16396C004C;
	Wed, 22 Jul 2020 15:39:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6D683C004C
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jul 2020 15:39:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5AC0F882F2
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jul 2020 15:39:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NSTM5J6yv8N9 for <iommu@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 15:39:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 79F9F882EB
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jul 2020 15:39:15 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id D1DC941A; Wed, 22 Jul 2020 17:39:11 +0200 (CEST)
Date: Wed, 22 Jul 2020 17:39:10 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH] iommu/qcom: Use domain rather than dev as tlb cookie
Message-ID: <20200722153910.GM27672@8bytes.org>
References: <20200720155217.274994-1-robdclark@gmail.com>
 <CA+G9fYtj1RBYcPhXZRm-qm5ygtdLj1jD8vFZSqQvwi_DNJLBwQ@mail.gmail.com>
 <20200722131009.GD27672@8bytes.org>
 <CAF6AEGteY6Mwy+jQaj6Vo0e4bMW6P1q19PMmdOqQrxr-RQxkQg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGteY6Mwy+jQaj6Vo0e4bMW6P1q19PMmdOqQrxr-RQxkQg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Rob Clark <robdclark@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Andy Gross <agross@kernel.org>, Robin Murphy <robin.murphy@arm.com>
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

On Wed, Jul 22, 2020 at 07:54:40AM -0700, Rob Clark wrote:
> On Wed, Jul 22, 2020 at 6:10 AM Joerg Roedel <joro@8bytes.org> wrote:
> > Is this needed for v5.8/stable? A fixes tag would be great too.
> 
> looks like, yes:
> 
> Fixes: 09b5dfff9ad6 ("iommu/qcom: Use accessor functions for iommu
> private data")

Thanks, applied to fixes branch.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
