Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 56445175F38
	for <lists.iommu@lfdr.de>; Mon,  2 Mar 2020 17:08:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id CA6F7876F4;
	Mon,  2 Mar 2020 16:08:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dxlcqb1DSeHg; Mon,  2 Mar 2020 16:08:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1FB9D875BB;
	Mon,  2 Mar 2020 16:08:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EDE6BC1D8E;
	Mon,  2 Mar 2020 16:08:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AA40AC013E
 for <iommu@lists.linux-foundation.org>; Mon,  2 Mar 2020 16:08:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A7242855BD
 for <iommu@lists.linux-foundation.org>; Mon,  2 Mar 2020 16:08:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s0FACkUYKN8C for <iommu@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 16:08:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D71DC85693
 for <iommu@lists.linux-foundation.org>; Mon,  2 Mar 2020 16:08:18 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 013665BC; Mon,  2 Mar 2020 17:08:16 +0100 (CET)
Date: Mon, 2 Mar 2020 17:08:14 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Yonghyun Hwang <yonghyun@google.com>
Subject: Re: [PATCH v3] iommu/vt-d: Fix a bug in intel_iommu_iova_to_phys()
 for huge page
Message-ID: <20200302160813.GB7829@8bytes.org>
References: <20200226203006.51567-1-yonghyun@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200226203006.51567-1-yonghyun@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Havard Skinnemoen <hskinnemoen@google.com>, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Deepa Dinamani <deepadinamani@google.com>, Moritz Fischer <mdf@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>
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

On Wed, Feb 26, 2020 at 12:30:06PM -0800, Yonghyun Hwang wrote:
> intel_iommu_iova_to_phys() has a bug when it translates an IOVA for a huge
> page onto its corresponding physical address. This commit fixes the bug by
> accomodating the level of page entry for the IOVA and adds IOVA's lower
> address to the physical address.
> 
> Cc: <stable@vger.kernel.org>
> Acked-by: Lu Baolu <baolu.lu@linux.intel.com>
> Reviewed-by: Moritz Fischer <mdf@kernel.org>
> Signed-off-by: Yonghyun Hwang <yonghyun@google.com>

Applied with Fixes tag:

Fixes: 3871794642579 ("VT-d: Changes to support KVM")
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
