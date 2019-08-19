Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C13C92592
	for <lists.iommu@lfdr.de>; Mon, 19 Aug 2019 15:53:48 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E90A8E5D;
	Mon, 19 Aug 2019 13:53:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8A45FE3C
	for <iommu@lists.linux-foundation.org>;
	Mon, 19 Aug 2019 13:53:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 3AD5167F
	for <iommu@lists.linux-foundation.org>;
	Mon, 19 Aug 2019 13:53:44 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F20028;
	Mon, 19 Aug 2019 06:53:43 -0700 (PDT)
Received: from [10.37.12.162] (unknown [10.37.12.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 54FBF3F718;
	Mon, 19 Aug 2019 06:53:42 -0700 (PDT)
Subject: Re: [Xen-devel] [PATCH 08/11] swiotlb-xen: use the same foreign page
	check everywhere
To: Christoph Hellwig <hch@lst.de>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
References: <20190816130013.31154-1-hch@lst.de>
	<20190816130013.31154-9-hch@lst.de>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <5c987a35-4e66-6d12-82e4-06fcffc3be3e@arm.com>
Date: Mon, 19 Aug 2019 14:53:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190816130013.31154-9-hch@lst.de>
Content-Language: en-US
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org,
	x86@kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Hi Christoph,

On 8/16/19 2:00 PM, Christoph Hellwig wrote:
> xen_dma_map_page uses a different and more complicated check for
> foreign pages than the other three cache maintainance helpers.
> Switch it to the simpler pfn_vali method a well.

NIT: s/pfn_vali/pfn_valid/

> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Julien Grall <julien.grall@arm.com>

Cheers,

-- 
Julien Grall
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
