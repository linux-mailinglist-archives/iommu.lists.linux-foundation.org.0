Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA0826DA54
	for <lists.iommu@lfdr.de>; Thu, 17 Sep 2020 13:35:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9D7DB874F5;
	Thu, 17 Sep 2020 11:35:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id itstizN8IaXT; Thu, 17 Sep 2020 11:35:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A038487272;
	Thu, 17 Sep 2020 11:35:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7B922C0859;
	Thu, 17 Sep 2020 11:35:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F04FCC0859
 for <iommu@lists.linux-foundation.org>; Thu, 17 Sep 2020 11:35:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D2B7086DE0
 for <iommu@lists.linux-foundation.org>; Thu, 17 Sep 2020 11:35:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 25fJFyp8hA8e for <iommu@lists.linux-foundation.org>;
 Thu, 17 Sep 2020 11:35:17 +0000 (UTC)
X-Greylist: delayed 00:07:56 by SQLgrey-1.7.6
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 68A7886DB5
 for <iommu@lists.linux-foundation.org>; Thu, 17 Sep 2020 11:35:17 +0000 (UTC)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BsZSM4Dglz9sTW; Thu, 17 Sep 2020 21:27:15 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 iommu@lists.linux-foundation.org
In-Reply-To: <20200818221126.391073-1-bauerman@linux.ibm.com>
References: <20200818221126.391073-1-bauerman@linux.ibm.com>
Subject: Re: [PATCH v3] powerpc/pseries/svm: Allocate SWIOTLB buffer anywhere
 in memory
Message-Id: <160034200698.3339803.12661483575080905618.b4-ty@ellerman.id.au>
Date: Thu, 17 Sep 2020 21:27:15 +1000 (AEST)
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Ram Pai <linuxram@us.ibm.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Tue, 18 Aug 2020 19:11:26 -0300, Thiago Jung Bauermann wrote:
> POWER secure guests (i.e., guests which use the Protection Execution
> Facility) need to use SWIOTLB to be able to do I/O with the hypervisor, but
> they don't need the SWIOTLB memory to be in low addresses since the
> hypervisor doesn't have any addressing limitation.
> 
> This solves a SWIOTLB initialization problem we are seeing in secure guests
> with 128 GB of RAM: they are configured with 4 GB of crashkernel reserved
> memory, which leaves no space for SWIOTLB in low addresses.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/pseries/svm: Allocate SWIOTLB buffer anywhere in memory
      https://git.kernel.org/powerpc/c/eae9eec476d13fad9af6da1f44a054ee02b7b161

cheers
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
