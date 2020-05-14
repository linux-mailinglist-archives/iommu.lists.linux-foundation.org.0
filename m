Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 529761D30CB
	for <lists.iommu@lfdr.de>; Thu, 14 May 2020 15:13:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 05FF087838;
	Thu, 14 May 2020 13:13:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8xWYQVz7mkhH; Thu, 14 May 2020 13:13:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id CDCFF88A1F;
	Thu, 14 May 2020 13:13:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B6404C016F;
	Thu, 14 May 2020 13:13:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BED9DC016F
 for <iommu@lists.linux-foundation.org>; Thu, 14 May 2020 13:13:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id ACC0589746
 for <iommu@lists.linux-foundation.org>; Thu, 14 May 2020 13:13:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id glcJg7tyfC7Q for <iommu@lists.linux-foundation.org>;
 Thu, 14 May 2020 13:13:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 29B438973B
 for <iommu@lists.linux-foundation.org>; Thu, 14 May 2020 13:13:19 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id E20BA379; Thu, 14 May 2020 15:13:16 +0200 (CEST)
Date: Thu, 14 May 2020 15:13:15 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Sai Praneeth Prakhya <sai.praneeth.prakhya@intel.com>
Subject: Re: [PATCH] iommu: Remove functions that support private domain
Message-ID: <20200514131315.GJ18353@8bytes.org>
References: <20200513224721.20504-1-sai.praneeth.prakhya@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200513224721.20504-1-sai.praneeth.prakhya@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org
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

On Wed, May 13, 2020 at 03:47:21PM -0700, Sai Praneeth Prakhya wrote:
> After moving iommu_group setup to iommu core code [1][2] and removing
> private domain support in vt-d [3], there are no users for functions such
> as iommu_request_dm_for_dev(), iommu_request_dma_domain_for_dev() and
> request_default_domain_for_dev(). So, remove these functions.

I thought these functions are needed for the per-group default-domain
patch-set? That is why I left them in for now, but I can also remove
them if not.


	Joerg

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
