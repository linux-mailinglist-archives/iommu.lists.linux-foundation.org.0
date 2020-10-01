Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCDD27FFA4
	for <lists.iommu@lfdr.de>; Thu,  1 Oct 2020 14:59:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2F237869B4;
	Thu,  1 Oct 2020 12:59:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K6Duod1UmrFP; Thu,  1 Oct 2020 12:59:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 822FC869DF;
	Thu,  1 Oct 2020 12:59:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 72E64C0895;
	Thu,  1 Oct 2020 12:59:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 792C9C0051
 for <iommu@lists.linux-foundation.org>; Thu,  1 Oct 2020 12:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6785387302
 for <iommu@lists.linux-foundation.org>; Thu,  1 Oct 2020 12:59:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IWlmxBTAIANt for <iommu@lists.linux-foundation.org>;
 Thu,  1 Oct 2020 12:59:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E4D4087301
 for <iommu@lists.linux-foundation.org>; Thu,  1 Oct 2020 12:59:52 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 24D1E26F; Thu,  1 Oct 2020 14:59:51 +0200 (CEST)
Date: Thu, 1 Oct 2020 14:59:49 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Subject: Re: [PATCH 00/13] iommu: amd: Add Generic IO Page Table Framework
 Support
Message-ID: <20201001125949.GG30426@8bytes.org>
References: <20200923101442.73157-1-suravee.suthikulpanit@amd.com>
 <20200924103448.GO27174@8bytes.org>
 <c4b95103-8c66-6a9b-af18-a7c40d9dd943@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c4b95103-8c66-6a9b-af18-a7c40d9dd943@amd.com>
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

On Thu, Sep 24, 2020 at 05:50:37PM +0700, Suravee Suthikulpanit wrote:
> 
> 
> On 9/24/20 5:34 PM, Joerg Roedel wrote:
> > Hi Suravee,
> > 
> > On Wed, Sep 23, 2020 at 10:14:29AM +0000, Suravee Suthikulpanit wrote:
> > > The framework allows callable implementation of IO page table.
> > > This allows AMD IOMMU driver to switch between different types
> > > of AMD IOMMU page tables (e.g. v1 vs. v2).
> > 
> > Is there a reason you created your own framework, there is already an
> > io-pgtable framework for ARM, maybe that can be reused?
> > 
> 
> Actually, this is the same framework used by ARM codes.
> Sorry if the description is not clear.

Ah, right, thanks. I think this should spend some time in linux-next
before going upstream. Can you please remind me after the next merge
window to pick it up?

Thanks,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
