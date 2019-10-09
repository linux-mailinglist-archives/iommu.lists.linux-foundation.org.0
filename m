Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C673D13D6
	for <lists.iommu@lfdr.de>; Wed,  9 Oct 2019 18:18:22 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D025CBDC;
	Wed,  9 Oct 2019 16:18:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id BAAC7B7D
	for <iommu@lists.linux-foundation.org>;
	Wed,  9 Oct 2019 16:18:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from ale.deltatee.com (ale.deltatee.com [207.54.116.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 75149709
	for <iommu@lists.linux-foundation.org>;
	Wed,  9 Oct 2019 16:18:15 +0000 (UTC)
Received: from s0106ac1f6bb1ecac.cg.shawcable.net ([70.73.163.230]
	helo=[192.168.11.155]) by ale.deltatee.com with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
	(envelope-from <logang@deltatee.com>)
	id 1iIEfE-0007Md-Fx; Wed, 09 Oct 2019 10:18:13 -0600
To: Christoph Hellwig <hch@infradead.org>
References: <20191008221837.13067-1-logang@deltatee.com>
	<20191008221837.13067-2-logang@deltatee.com>
	<20191009065750.GA17832@infradead.org>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <c5f6750f-b415-3562-9abe-0937bae94f75@deltatee.com>
Date: Wed, 9 Oct 2019 10:17:36 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191009065750.GA17832@infradead.org>
Content-Language: en-US
X-SA-Exim-Connect-IP: 70.73.163.230
X-SA-Exim-Rcpt-To: kchow@gigaio.com, joro@8bytes.org,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
	hch@infradead.org
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
Subject: Re: [PATCH 1/3] iommu/amd: Implement dma_[un]map_resource()
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
Cc: iommu@lists.linux-foundation.org, Kit Chow <kchow@gigaio.com>,
	linux-kernel@vger.kernel.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org



On 2019-10-09 12:57 a.m., Christoph Hellwig wrote:
> On Tue, Oct 08, 2019 at 04:18:35PM -0600, Logan Gunthorpe wrote:
>> From: Kit Chow <kchow@gigaio.com>
>>
>> Currently the Intel IOMMU uses the default dma_[un]map_resource()
> 
> s/Intel/AMD/ ?

Oops, yes, my mistake.

>> +static dma_addr_t map_resource(struct device *dev, phys_addr_t paddr,
>> +		size_t size, enum dma_data_direction dir, unsigned long attrs)
>> +{
>> +	struct protection_domain *domain;
>> +	struct dma_ops_domain *dma_dom;
>> +
>> +	domain = get_domain(dev);
>> +	if (PTR_ERR(domain) == -EINVAL)
>> +		return (dma_addr_t)paddr;
> 
> I thought that case can't happen anymore?
> 
> Also note that Joerg just applied the patch to convert the AMD iommu
> driver to use the dma-iommu ops.  Can you test that series and check
> it does the right thing for your use case?  From looking at the code
> I think it should.

Yes, looking at the new code, it looks like this patch will not be
needed. So we can drop it. We'll test it to make sure.

I believe the other two patches in this series are still needed though.

Thanks,

Logan


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
