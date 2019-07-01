Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CD03D536
	for <lists.iommu@lfdr.de>; Tue, 11 Jun 2019 20:10:29 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 691F210B4;
	Tue, 11 Jun 2019 18:10:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 46F7410AF
	for <iommu@lists.linux-foundation.org>;
	Tue, 11 Jun 2019 18:10:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 876EF6D6
	for <iommu@lists.linux-foundation.org>;
	Tue, 11 Jun 2019 18:10:26 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Jun 2019 11:10:25 -0700
X-ExtLoop1: 1
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
	by orsmga007.jf.intel.com with ESMTP; 11 Jun 2019 11:10:25 -0700
Date: Tue, 11 Jun 2019 11:13:33 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Subject: Re: [PATCH 1/8] iommu: Add I/O ASID allocator
Message-ID: <20190611111333.425ce809@jacob-builder>
In-Reply-To: <62d1f310-0cba-4d55-0f16-68bba3c64927@arm.com>
References: <20190610184714.6786-1-jean-philippe.brucker@arm.com>
	<20190610184714.6786-2-jean-philippe.brucker@arm.com>
	<20190611103625.00001399@huawei.com>
	<62d1f310-0cba-4d55-0f16-68bba3c64927@arm.com>
Organization: OTC
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, will.deacon@arm.com,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	robh+dt@kernel.org, robin.murphy@arm.com,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On Tue, 11 Jun 2019 15:35:22 +0100
Jean-Philippe Brucker <jean-philippe.brucker@arm.com> wrote:

> On 11/06/2019 10:36, Jonathan Cameron wrote:
> >> +/**
> >> + * ioasid_alloc - Allocate an IOASID
> >> + * @set: the IOASID set
> >> + * @min: the minimum ID (inclusive)
> >> + * @max: the maximum ID (inclusive)
> >> + * @private: data private to the caller
> >> + *
> >> + * Allocate an ID between @min and @max. The @private pointer is
> >> stored
> >> + * internally and can be retrieved with ioasid_find().
> >> + *
> >> + * Return: the allocated ID on success, or %INVALID_IOASID on
> >> failure.
> >> + */
> >> +ioasid_t ioasid_alloc(struct ioasid_set *set, ioasid_t min,
> >> ioasid_t max,
> >> +		      void *private)
> >> +{
> >> +	u32 id = INVALID_IOASID;
> >> +	struct ioasid_data *data;
> >> +
> >> +	data = kzalloc(sizeof(*data), GFP_KERNEL);
> >> +	if (!data)
> >> +		return INVALID_IOASID;
> >> +
> >> +	data->set = set;
> >> +	data->private = private;
> >> +
> >> +	if (xa_alloc(&ioasid_xa, &id, data, XA_LIMIT(min, max),
> >> GFP_KERNEL)) {
> >> +		pr_err("Failed to alloc ioasid from %d to %d\n",
> >> min, max);
> >> +		goto exit_free;
> >> +	}
> >> +	data->id = id;
> >> +
> >> +exit_free:  
> > 
> > This error flow is perhaps a little more confusing than it needs to
> > be?
> > 
> > My assumption (perhaps wrong) is that we only have an id ==
> > INVALID_IOASID if the xa_alloc fails, and that we will always have
> > such an id value if it does (I'm not totally sure this second
> > element is true in __xa_alloc).
> > 
> > If I'm missing something perhaps a comment on how else we'd get
> > here.  
> 
> Yes we can simplify this:
> 
> 		return id;
> 	exit_free:
> 		kfree(data)
> 		return INVALID_IOASID;
> 	}
> 
> The XA API doesn't say that @id passed to xa_alloc() won't be modified
> in case of error. It's true in the current implementation, but won't
> necessarily stay that way. On the other hand I think it's safe to
> expect @id to always be set when xa_alloc() succeeds.
> 
the flow with custom allocator is slightly different, but you are right
I can simplify it as you suggested.
Jonathan, I will add you to the cc list in next version. If you could
also review the current version, it would be greatly appreciated.

https://lore.kernel.org/lkml/1560087862-57608-13-git-send-email-jacob.jun.pan@linux.intel.com/

> >> +/**
> >> + * ioasid_find - Find IOASID data
> >> + * @set: the IOASID set
> >> + * @ioasid: the IOASID to find
> >> + * @getter: function to call on the found object
> >> + *
> >> + * The optional getter function allows to take a reference to the
> >> found object
> >> + * under the rcu lock. The function can also check if the object
> >> is still valid:
> >> + * if @getter returns false, then the object is invalid and NULL
> >> is returned.
> >> + *
> >> + * If the IOASID has been allocated for this set, return the
> >> private pointer
> >> + * passed to ioasid_alloc. Private data can be NULL if not set.
> >> Return an error
> >> + * if the IOASID is not found or does not belong to the set.  
> > 
> > Perhaps should make it clear that @set can be null.  
> 
> Indeed. But I'm not sure allowing @set to be NULL is such a good idea,
> because the data type associated to an ioasid depends on its set. For
> example SVA will put an mm_struct in there, and auxiliary domains use
> some structure private to the IOMMU domain.
> 
I am not sure we need to count on @set to decipher data type. Whoever
does the allocation and owns the IOASID should knows its own data type.
My thought was that @set is only used to group IDs, permission check
etc.

> Jacob, could me make @set mandatory, or do you see a use for a global
> search? If @set is NULL, then callers can check if the return pointer
> is NULL, but will run into trouble if they try to dereference it.
> 
A global search use case can be for PRQ. IOMMU driver gets a IOASID
(first interrupt then retrieve from a queue), it has no idea which
@set it belongs to. But the data types are the same for all IOASIDs
used by the IOMMU.
If @set is NULL, the search does not check set match. It is separate
from return pointer. Sorry i am not seeing the problems here.

> >   
> >> + */
> >> +void *ioasid_find(struct ioasid_set *set, ioasid_t ioasid,
> >> +		  bool (*getter)(void *))
> >> +{
> >> +	void *priv = NULL;  
> > 
> > Set in all paths, so does need to be set here.  
> 
> Right
> 
> Thanks,
> Jean

[Jacob Pan]
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
