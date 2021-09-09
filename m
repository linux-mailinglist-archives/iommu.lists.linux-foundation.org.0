Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDA54047DC
	for <lists.iommu@lfdr.de>; Thu,  9 Sep 2021 11:36:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 20A304056B;
	Thu,  9 Sep 2021 09:36:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rya7tAy63iGY; Thu,  9 Sep 2021 09:36:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 3030440566;
	Thu,  9 Sep 2021 09:36:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EEF48C000D;
	Thu,  9 Sep 2021 09:36:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9B18FC000D
 for <iommu@lists.linux-foundation.org>; Thu,  9 Sep 2021 09:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89E8040564
 for <iommu@lists.linux-foundation.org>; Thu,  9 Sep 2021 09:36:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RYdFHLMA2NMh for <iommu@lists.linux-foundation.org>;
 Thu,  9 Sep 2021 09:36:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5278540185
 for <iommu@lists.linux-foundation.org>; Thu,  9 Sep 2021 09:36:19 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 724C060F; Thu,  9 Sep 2021 11:36:15 +0200 (CEST)
Date: Thu, 9 Sep 2021 11:36:09 +0200
From: Joerg Roedel <joro@8bytes.org>
To: "Suthikulpanit, Suravee" <suravee.suthikulpanit@amd.com>
Subject: Re: [PATCH 0/3] iommu/amd: Fix unable to handle page fault due to AVIC
Message-ID: <YTnViaK3uRNSGK8Q@8bytes.org>
References: <20210820202957.187572-1-suravee.suthikulpanit@amd.com>
 <f2ec4e5c-3bb1-b703-8842-34357e084bad@amd.com>
 <YTB/jWr9vb6xvTQp@8bytes.org>
 <5c7921f4-70ad-5d14-f44c-22a49c2ac068@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5c7921f4-70ad-5d14-f44c-22a49c2ac068@amd.com>
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

On Thu, Sep 02, 2021 at 09:13:00AM -0700, Suthikulpanit, Suravee wrote:
> I'll do that.

New plan: I queued them now and added the Fixes tag. Will send a
pull-request tomorrow to get them upstream together with a couple of
other fixes.

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
