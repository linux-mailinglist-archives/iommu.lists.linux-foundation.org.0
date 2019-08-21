Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 11003978F4
	for <lists.iommu@lfdr.de>; Wed, 21 Aug 2019 14:14:25 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id AC188FC1;
	Wed, 21 Aug 2019 12:14:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 96F53F7C
	for <iommu@lists.linux-foundation.org>;
	Wed, 21 Aug 2019 12:14:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2AA1D8A6
	for <iommu@lists.linux-foundation.org>;
	Wed, 21 Aug 2019 12:14:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 753238AC700;
	Wed, 21 Aug 2019 12:14:21 +0000 (UTC)
Received: from [10.36.116.105] (ovpn-116-105.ams2.redhat.com [10.36.116.105])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9671B2B9D9;
	Wed, 21 Aug 2019 12:14:16 +0000 (UTC)
Subject: Re: [PATCH v2] iommu: revisit iommu_insert_resv_region()
	implementation
To: Christoph Hellwig <hch@infradead.org>
References: <20190801155946.20645-1-eric.auger@redhat.com>
	<20190806073202.GA26575@infradead.org>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <58fa88cb-0ba6-4ba0-130c-091ad5274795@redhat.com>
Date: Wed, 21 Aug 2019 14:14:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190806073202.GA26575@infradead.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.69]);
	Wed, 21 Aug 2019 12:14:21 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: alex.williamson@redhat.com, robin.murphy@arm.com,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	dwmw2@infradead.org, eric.auger.pro@gmail.com
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

Hi Christoph,

On 8/6/19 9:32 AM, Christoph Hellwig wrote:
> A couple nitpicks below:
> 
> On Thu, Aug 01, 2019 at 05:59:46PM +0200, Eric Auger wrote:
>> - * The new element is sorted by address with respect to the other
>> - * regions of the same type. In case it overlaps with another
>> - * region of the same type, regions are merged. In case it
>> - * overlaps with another region of different type, regions are
>> - * not merged.
>> + * Elements are sorted by start address and overlapping segments
>> + * of the same type are merged.
>>   */
>> +int iommu_insert_resv_region(struct iommu_resv_region *new,
>> +			     struct list_head *regions)
>>  {
>> +	struct iommu_resv_region *iter, *tmp, *nr, *top;
>> +	struct list_head stack;
>> +	bool added = false;
>>  
>> +	INIT_LIST_HEAD(&stack);

Please forgive me for the delay. I am just back to the office.
> 
> Nit: you could just use
> 
> 	LIST_HEAD(&stack);
> 
> to declare and initialize the variable in a single line.
done
> 
>> +	nr = iommu_alloc_resv_region(new->start, new->length,
>> +				     new->prot, new->type);
>> +	if (!nr)
>>  		return -ENOMEM;
>>  
>> +	/* First add the new elt based on start address sorting */
> 
> /elt/element/ ?
yes
> 
>> +	list_for_each_entry(iter, regions, list) {
>> +		if (nr->start < iter->start) {
>> +			list_add_tail(&nr->list, &iter->list);
>> +			added = true;
>> +			break;
>> +		} else if (nr->start == iter->start && nr->type <= iter->type) {
>> +			list_add_tail(&nr->list, &iter->list);
>> +			added = true;
>> +			break;
>> +		}
> 
> Nit:  no need for an else after a a break.  But then again  both
> branches look identical, so why don't you just merge them:
> 
> 		if (nr->start < iter->start ||
> 		    (nr->start == iter->start && nr->type <= iter->type)) {
> 			list_add_tail(&nr->list, &iter->list);
> 			added = true;
> 			break;
I merged both
> 
> 	}
> 
>> +	if (!added)
>> +		list_add_tail(&nr->list, regions);
> 
> Probably down to preference, but I'd just use a goto to jump past the
> list_add and save the added variable.
done
> 
>> +	/* Merge overlapping segments of type nr->type, if any */
>> +	list_for_each_entry_safe(iter, tmp, regions, list) {
>> +		phys_addr_t top_end, iter_end = iter->start + iter->length - 1;
>> +		bool found = false;
>> +
>> +		/* no merge needed on elements of different types than @nr */
>> +		if (iter->type != nr->type) {
>> +			list_move_tail(&iter->list, &stack);
>> +			continue;
>> +		}
>> +
>> +		/* look for the last stack element of same type as @iter */
>> +		list_for_each_entry_reverse(top, &stack, list)
>> +			if (top->type == iter->type) {
>> +				found = true;
>> +				break;
>> +			}
>> +		if (!found) {
> 
> Same here.
done
> 
>> +			list_move_tail(&iter->list, &stack);
>> +			continue;
>> +		}
>> +
>> +		top_end = top->start + top->length - 1;
>> +
>> +		if (iter->start > top_end + 1) {
>> +			list_move_tail(&iter->list, &stack);
>> +		} else {
>> +			top->length = max(top_end, iter_end) - top->start + 1;
>> +			list_del(&iter->list);
>> +			kfree(iter);
>> +		}
> 
> I wonder if the body of the outer list_for_each_entry_safe loop would
> be a bit nicer in a helper, but again that is probably just down to
> personal preference.
I skipped that suggestion at the moment.

Hope that looks better in v3.

Thank you for your review!

Best Regards

Eric
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
