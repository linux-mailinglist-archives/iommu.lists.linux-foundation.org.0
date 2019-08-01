Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCF47DD8B
	for <lists.iommu@lfdr.de>; Thu,  1 Aug 2019 16:14:32 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 145C31618;
	Thu,  1 Aug 2019 14:10:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 3C9D0EBD
	for <iommu@lists.linux-foundation.org>;
	Thu,  1 Aug 2019 14:09:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C7CBF8A3
	for <iommu@lists.linux-foundation.org>;
	Thu,  1 Aug 2019 14:09:16 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id EEECA68AFE; Thu,  1 Aug 2019 16:09:13 +0200 (CEST)
Date: Thu, 1 Aug 2019 16:09:13 +0200
From: Christoph Hellwig <hch@lst.de>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH 1/3] iommu/vt-d: Refactor find_domain() helper
Message-ID: <20190801140913.GD23435@lst.de>
References: <20190801060156.8564-1-baolu.lu@linux.intel.com>
	<20190801060156.8564-2-baolu.lu@linux.intel.com>
	<20190801061021.GA14955@lst.de>
	<40f3a736-0a96-0491-61ad-0ddf03612d91@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <40f3a736-0a96-0491-61ad-0ddf03612d91@linux.intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kevin.tian@intel.com, ashok.raj@intel.com,
	Robin Murphy <robin.murphy@arm.com>,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	jacob.jun.pan@intel.com, David Woodhouse <dwmw2@infradead.org>,
	Christoph Hellwig <hch@lst.de>
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

On Thu, Aug 01, 2019 at 02:20:07PM +0800, Lu Baolu wrote:
> Hi Christoph,
>
> On 8/1/19 2:10 PM, Christoph Hellwig wrote:
>> On Thu, Aug 01, 2019 at 02:01:54PM +0800, Lu Baolu wrote:
>>> +	/* No lock here, assumes no domain exit in normal case */
>>
>> s/exit/exists/ ?
>
> This comment is just moved from one place to another in this patch.
>
> "no domain exit" means "the domain isn't freed". (my understand)

Maybe we'll get that refconfirmed and can fix up the comment?

>
>>
>>> +	info = dev->archdata.iommu;
>>> +	if (likely(info))
>>> +		return info->domain;
>>
>> But then again the likely would be odd.
>>
>
> Normally there's a domain for a device (default domain or isolation
> domain for assignment cases).

Makes sense, I just mean to say that the likely was contrary to my
understanding of the above comment.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
