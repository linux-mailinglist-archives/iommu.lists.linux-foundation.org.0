Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 938B832D30D
	for <lists.iommu@lfdr.de>; Thu,  4 Mar 2021 13:32:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04D3A4EBF3;
	Thu,  4 Mar 2021 12:32:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 94RD9iF9AFGl; Thu,  4 Mar 2021 12:32:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A9594EC03;
	Thu,  4 Mar 2021 12:32:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B701DC0010;
	Thu,  4 Mar 2021 12:32:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E7D7FC0001
 for <iommu@lists.linux-foundation.org>; Thu,  4 Mar 2021 12:32:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DBF7D6F5B7
 for <iommu@lists.linux-foundation.org>; Thu,  4 Mar 2021 12:32:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ibZJX4Ujlenm for <iommu@lists.linux-foundation.org>;
 Thu,  4 Mar 2021 12:32:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 398026F5B9
 for <iommu@lists.linux-foundation.org>; Thu,  4 Mar 2021 12:32:36 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 603EB321; Thu,  4 Mar 2021 13:32:33 +0100 (CET)
Date: Thu, 4 Mar 2021 13:32:31 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH] iommu/vt-d: Fix status code for Allocate/Free PASID
 command
Message-ID: <20210304123231.GE26414@8bytes.org>
References: <20210227073909.432-1-yuzenghui@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210227073909.432-1-yuzenghui@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: kevin.tian@intel.com, dwmw2@infradead.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, wanghaibin.wang@huawei.com, will@kernel.org
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

On Sat, Feb 27, 2021 at 03:39:09PM +0800, Zenghui Yu wrote:
> As per Intel vt-d spec, Rev 3.0 (section 10.4.45 "Virtual Command Response
> Register"), the status code of "No PASID available" error in response to
> the Allocate PASID command is 2, not 1. The same for "Invalid PASID" error
> in response to the Free PASID command.
> 
> We will otherwise see confusing kernel log under the command failure from
> guest side. Fix it.
> 
> Fixes: 24f27d32ab6b ("iommu/vt-d: Enlightened PASID allocation")
> Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>

Applied for v5.12, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
