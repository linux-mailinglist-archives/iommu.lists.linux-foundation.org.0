Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E953A3BFE
	for <lists.iommu@lfdr.de>; Fri, 30 Aug 2019 18:28:22 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id EA92C62A8;
	Fri, 30 Aug 2019 16:28:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 879666180
	for <iommu@lists.linux-foundation.org>;
	Fri, 30 Aug 2019 16:26:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 45C41EC
	for <iommu@lists.linux-foundation.org>;
	Fri, 30 Aug 2019 16:26:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DCA47344;
	Fri, 30 Aug 2019 09:26:50 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5188D3F718;
	Fri, 30 Aug 2019 09:26:48 -0700 (PDT)
Subject: Re: [PATCH] PCI: Move ATS declarations to linux/pci.h
To: Christoph Hellwig <hch@infradead.org>, Krzysztof Wilczynski <kw@linux.com>
References: <20190830150756.21305-1-kw@linux.com>
	<20190830161840.GA9733@infradead.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <26a81b41-515b-2ed8-98db-7ae164ee8dd8@arm.com>
Date: Fri, 30 Aug 2019 17:26:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190830161840.GA9733@infradead.org>
Content-Language: en-GB
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org, Bjorn Helgaas <helgaas@kernel.org>,
	Will Deacon <will@kernel.org>, David Woodhouse <dwmw2@infradead.org>,
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

On 30/08/2019 17:18, Christoph Hellwig wrote:
> On Fri, Aug 30, 2019 at 05:07:56PM +0200, Krzysztof Wilczynski wrote:
>> Move ATS function prototypes from include/linux/pci-ats.h to
>> include/linux/pci.h so users only need to include <linux/pci.h>:
> 
> Why is that so important?  Very few PCI(e) device drivers use ATS,
> so keeping it out of everyones include hell doesn't seem all bad.

Although to be fair it seems that all the actual ATS stuff already moved 
out 4 years ago, so at the very least maybe it would warrant renaming to 
pci-pri-pasid.h :)

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
