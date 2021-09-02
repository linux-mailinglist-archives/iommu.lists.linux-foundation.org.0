Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 533703FEA1C
	for <lists.iommu@lfdr.de>; Thu,  2 Sep 2021 09:39:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2C2B80B7C;
	Thu,  2 Sep 2021 07:39:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 59MzGmX9d5K0; Thu,  2 Sep 2021 07:39:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A451A80B6F;
	Thu,  2 Sep 2021 07:39:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 770E2C000E;
	Thu,  2 Sep 2021 07:39:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B92B6C000E
 for <iommu@lists.linux-foundation.org>; Thu,  2 Sep 2021 07:39:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A85F180B6F
 for <iommu@lists.linux-foundation.org>; Thu,  2 Sep 2021 07:39:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BuUYu26sm3Kg for <iommu@lists.linux-foundation.org>;
 Thu,  2 Sep 2021 07:39:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A416680B3C
 for <iommu@lists.linux-foundation.org>; Thu,  2 Sep 2021 07:39:01 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id BCABEE4; Thu,  2 Sep 2021 09:38:57 +0200 (CEST)
Date: Thu, 2 Sep 2021 09:38:53 +0200
From: Joerg Roedel <joro@8bytes.org>
To: "Suthikulpanit, Suravee" <suravee.suthikulpanit@amd.com>
Subject: Re: [PATCH 0/3] iommu/amd: Fix unable to handle page fault due to AVIC
Message-ID: <YTB/jWr9vb6xvTQp@8bytes.org>
References: <20210820202957.187572-1-suravee.suthikulpanit@amd.com>
 <f2ec4e5c-3bb1-b703-8842-34357e084bad@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f2ec4e5c-3bb1-b703-8842-34357e084bad@amd.com>
Cc: iommu@lists.linux-foundation.org, Jon.Grimm@amd.com,
 linux-kernel@vger.kernel.org, wei.huang2@amd.com
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

Hi Suravee,

On Tue, Aug 31, 2021 at 12:10:27PM -0500, Suthikulpanit, Suravee wrote:
> Here is an dditional tags for this series:
> 
> Fixes: 8bda0cfbdc1a ("iommu/amd: Detect and initialize guest vAPIC log")
> 
> Are there any concerns with this series?

No concerns, please add the tag and re-post when -rc1 is out. I will it
queue for -rc2 then.

Thanks,

	Joerg

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
