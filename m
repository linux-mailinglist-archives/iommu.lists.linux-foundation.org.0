Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A18F24ACDE
	for <lists.iommu@lfdr.de>; Thu, 20 Aug 2020 04:12:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7CC0B868BF;
	Thu, 20 Aug 2020 02:12:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5F8jZ3R8aXX4; Thu, 20 Aug 2020 02:12:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8E256868BC;
	Thu, 20 Aug 2020 02:12:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 752E3C07FF;
	Thu, 20 Aug 2020 02:12:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 24978C07FF
 for <iommu@lists.linux-foundation.org>; Thu, 20 Aug 2020 02:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2114184E27
 for <iommu@lists.linux-foundation.org>; Thu, 20 Aug 2020 02:12:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h4Qv18anLG7l for <iommu@lists.linux-foundation.org>;
 Thu, 20 Aug 2020 02:12:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0B886815D7
 for <iommu@lists.linux-foundation.org>; Thu, 20 Aug 2020 02:12:42 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BX7TM3wDzz9sRN;
 Thu, 20 Aug 2020 12:12:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1597889560;
 bh=gPdGSuMbBr6AKJw/++doCCfD8GkVb+j4pQ8PJ3xV49A=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=pZigIs87s/0HJCQu3CMeGxmU0e2JIr0P58tO7g3RDssIi9EJAWo6dG2xAEOeHDFUN
 H/U0C6GQyVs1FTXIqdcuIOi1g6VWt3esLh1358kQCRaPPn3HpgPcIfg7b0MqD4lPxa
 vaedp/MpmDiMZyRDSUDUTwoIyNc2WvONX4FWrm9ApXlgHzNAHzVOQ1LWJQ6aL7VIQv
 jYci3SYKpJhI7xoajLFJH8NrnUEgQdKBtqb/Gnjb6UVVuc40f9BgYZO2HAzBFkSGh8
 Ym6AviUgzKcWLDdtvnZFf5y5fvG+orpGwMv3tCGcngvhsq4jMphAzi+hKg7TzFnQqq
 YO31FxQ3zKJzg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christoph Hellwig <hch@lst.de>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Subject: Re: [PATCH v3] powerpc/pseries/svm: Allocate SWIOTLB buffer anywhere
 in memory
In-Reply-To: <20200819044351.GA19391@lst.de>
References: <20200818221126.391073-1-bauerman@linux.ibm.com>
 <20200819044351.GA19391@lst.de>
Date: Thu, 20 Aug 2020 12:12:35 +1000
Message-ID: <877dtuhxpo.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Robin Murphy <robin.murphy@arm.com>, Ram Pai <linuxram@us.ibm.com>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Christoph Hellwig <hch@lst.de> writes:
> On Tue, Aug 18, 2020 at 07:11:26PM -0300, Thiago Jung Bauermann wrote:
>> POWER secure guests (i.e., guests which use the Protection Execution
>> Facility) need to use SWIOTLB to be able to do I/O with the hypervisor, but
>> they don't need the SWIOTLB memory to be in low addresses since the
>> hypervisor doesn't have any addressing limitation.
>> 
>> This solves a SWIOTLB initialization problem we are seeing in secure guests
>> with 128 GB of RAM: they are configured with 4 GB of crashkernel reserved
>> memory, which leaves no space for SWIOTLB in low addresses.
>> 
>> To do this, we use mostly the same code as swiotlb_init(), but allocate the
>> buffer using memblock_alloc() instead of memblock_alloc_low().
>> 
>> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
>
> Looks fine to me (except for the pointlessly long comment lines, but I've
> been told that's the powerpc way).

They're 80 columns AFAICS?

cheers
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
