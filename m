Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id BA783358B9
	for <lists.iommu@lfdr.de>; Wed,  5 Jun 2019 10:37:42 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E12A2C87;
	Wed,  5 Jun 2019 08:37:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 0F41A2F
	for <iommu@lists.linux-foundation.org>;
	Wed,  5 Jun 2019 08:37:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 924F419B
	for <iommu@lists.linux-foundation.org>;
	Wed,  5 Jun 2019 08:37:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id B76D4AB87;
	Wed,  5 Jun 2019 08:37:37 +0000 (UTC)
Subject: Re: [PATCH v2 3/3] xen/swiotlb: remember having called
	xen_create_contiguous_region()
To: Christoph Hellwig <hch@infradead.org>
References: <20190529090407.1225-1-jgross@suse.com>
	<20190529090407.1225-4-jgross@suse.com>
	<20190530090409.GB30428@infradead.org>
	<eebb0275-9418-717f-97d7-5e55917f46fd@oracle.com>
	<2fbfc6a7-572c-1ce2-3323-802f9a77500e@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <0fcd8b61-7714-2278-e552-f0b72d9c5d1a@suse.com>
Date: Wed, 5 Jun 2019 10:37:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <2fbfc6a7-572c-1ce2-3323-802f9a77500e@suse.com>
Content-Language: de-DE
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
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

On 31.05.19 13:38, Juergen Gross wrote:
> On 30/05/2019 14:46, Boris Ostrovsky wrote:
>> On 5/30/19 5:04 AM, Christoph Hellwig wrote:
>>> Please don't add your private flag to page-flags.h.  The whole point of
>>> the private flag is that you can use it in any way you want withou
>>> touching the common code.
>>
>>
>> There is already a bunch of aliases for various sub-components
>> (including Xen) in page-flags.h for private flags, which is why I
>> suggested we do the same for the new use case. Adding this new alias
>> will keep flag usage consistent.
> 
> What about me adding another patch moving those Xen private aliases
> into arch/x86/include/asm/xen/page.h ?

This is becoming difficult.

I'd need to remove the "#undef PF_NO_COMPOUND" from page-flags.h or to
#include a (new) xen/page-flags.h from page-flags.h after all the
defines are ready. Is that really worth the effort given that other
components (e.g. file systems) are doing the same?


Juergen
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
