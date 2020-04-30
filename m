Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id C26751BF82A
	for <lists.iommu@lfdr.de>; Thu, 30 Apr 2020 14:23:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4C74086A36;
	Thu, 30 Apr 2020 12:23:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M33DgVVZWPUo; Thu, 30 Apr 2020 12:23:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E753D86A0E;
	Thu, 30 Apr 2020 12:23:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C9A2EC016F;
	Thu, 30 Apr 2020 12:23:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 65F80C016F
 for <iommu@lists.linux-foundation.org>; Thu, 30 Apr 2020 12:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 495BB88611
 for <iommu@lists.linux-foundation.org>; Thu, 30 Apr 2020 12:23:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PWhAyzNJZy1b for <iommu@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 12:23:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D71F5885E3
 for <iommu@lists.linux-foundation.org>; Thu, 30 Apr 2020 12:23:38 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 85D3A3E2; Thu, 30 Apr 2020 14:23:35 +0200 (CEST)
Date: Thu, 30 Apr 2020 14:23:32 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH] drivers/iommu: properly export iommu_group_get_for_dev
Message-ID: <20200430122332.GP21900@8bytes.org>
References: <20200430120120.2948448-1-gregkh@linuxfoundation.org>
 <20200430121753.GA22842@willie-the-truck>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200430121753.GA22842@willie-the-truck>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 iommu@lists.linux-foundation.org, Joerg Roedel <jroedel@suse.de>,
 linux-kernel@vger.kernel.org
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

On Thu, Apr 30, 2020 at 01:17:53PM +0100, Will Deacon wrote:
> Thanks, not sure how I managed to screw this up in the original patch!
> 
> Acked-by: Will Deacon <will@kernel.org>
> 
> Joerg -- can you pick this one up please?

Yes, will send it as a fix for 5.7, but note that this function will be
unexported in 5.8.


Regards,

	Joerg

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
