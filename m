Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D76648DB03
	for <lists.iommu@lfdr.de>; Thu, 13 Jan 2022 16:50:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01B8E84CC9;
	Thu, 13 Jan 2022 15:50:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JVSjbHkRgnYk; Thu, 13 Jan 2022 15:50:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 16EE784CC3;
	Thu, 13 Jan 2022 15:50:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C7549C001E;
	Thu, 13 Jan 2022 15:50:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EE290C001E
 for <iommu@lists.linux-foundation.org>; Thu, 13 Jan 2022 15:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8856409E8
 for <iommu@lists.linux-foundation.org>; Thu, 13 Jan 2022 15:50:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ax160WEyG3c7 for <iommu@lists.linux-foundation.org>;
 Thu, 13 Jan 2022 15:50:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E940940901
 for <iommu@lists.linux-foundation.org>; Thu, 13 Jan 2022 15:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642089041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0RQ3puUcYuHO/5UfsU4Xhhp2Gu/t2oxOAbK9fU144eE=;
 b=RwcpVaOQpoP3+Jj5f1l3w6B8jXiSIQ40wz45tKZzM54sRhUJyTkeYAENGk7VoN7J0yQnwq
 Rf7o4qiSSmFyQd2XwCKgivDua/xvusrPRcoYdu2yFKgYHuZSMsx7vyKYWlBUWmi2Pp7qax
 GejVf5xk6yZ70cHIDzqdmSENEPQ84e0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-159-hpOt24UmN6SGycv75wD1lw-1; Thu, 13 Jan 2022 10:50:40 -0500
X-MC-Unique: hpOt24UmN6SGycv75wD1lw-1
Received: by mail-ed1-f71.google.com with SMTP id
 m8-20020a056402510800b003f9d22c4d48so5701593edd.21
 for <iommu@lists.linux-foundation.org>; Thu, 13 Jan 2022 07:50:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=0RQ3puUcYuHO/5UfsU4Xhhp2Gu/t2oxOAbK9fU144eE=;
 b=4dQH0QMv5g87uvQ8fBRSdGpx9qYoS6OCZavTih+90KbQ0gcdCGjycEaXoYyi27Dsbh
 I8b9/QmZvL1Yjg+MlEjbGi3FErarJzN5LVIusOy6HliV7CFwCo46vmF1QWiCSQjlgdvd
 /oX9tbQbkuVfcsXDsLLRU226fZHM0Axbc46d+Bg+SO4dDHRrNgTVQQxd+yTb/2vQyu8E
 7esu4yazBmDpP3nnTRIpfW5FkGQfK9RTi1gPNKB4RpGolj603LoBx1SJB2nCdCDRj2w7
 /IcCgP33WV6ZkEExwOiD0HhOEqyKtG5AL8QsawVcfQgPVigIFeWYle7yDWHEImywlpF/
 qrVQ==
X-Gm-Message-State: AOAM532jTejk+7Fzq5mvtSUq5Frgdvm6ecUmayLJOxj1b3OLeggVZ7P6
 paccyEADg8dVsWdvuN9q806eqPJRk5Wbcd+sf2ocKabkkCDHNfmobcdZ1jWWJMwmoBLUPUrV3JY
 cEt+2y3vKkuXgPMX8t3oWAsn3XnTgSg==
X-Received: by 2002:a05:6402:3588:: with SMTP id
 y8mr4824691edc.147.1642089039314; 
 Thu, 13 Jan 2022 07:50:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwNFlqW+90z8MqJGfmQJtPI4aVOG3CgxuC8pcaaa86GGnEzwNl0A4gvDtrNM26vya8mfn/rVA==
X-Received: by 2002:a05:6402:3588:: with SMTP id
 y8mr4824671edc.147.1642089039121; 
 Thu, 13 Jan 2022 07:50:39 -0800 (PST)
Received: from ?IPV6:2003:cb:c703:e200:8511:ed0f:ac2c:42f7?
 (p200300cbc703e2008511ed0fac2c42f7.dip0.t-ipconnect.de.
 [2003:cb:c703:e200:8511:ed0f:ac2c:42f7])
 by smtp.gmail.com with ESMTPSA id qw4sm1026745ejc.55.2022.01.13.07.50.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jan 2022 07:50:38 -0800 (PST)
Message-ID: <5da2e9ae-24bc-a146-053d-a43063bad73e@redhat.com>
Date: Thu, 13 Jan 2022 16:50:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH v3 3/8] mm: migrate: allocate the right size of non
 hugetlb or THP compound pages.
To: Zi Yan <ziy@nvidia.com>
References: <20220105214756.91065-1-zi.yan@sent.com>
 <20220105214756.91065-4-zi.yan@sent.com>
 <970ca2a4-416d-7e8f-37c7-510c5b050f4b@redhat.com>
 <15E26B9B-8AE2-4916-94E7-D0BBB2491B1B@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <15E26B9B-8AE2-4916-94E7-D0BBB2491B1B@nvidia.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: Mel Gorman <mgorman@techsingularity.net>,
 Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, iommu@lists.linux-foundation.org,
 Eric Ren <renzhengeek@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>, Vlastimil Babka <vbabka@suse.cz>
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

On 13.01.22 16:46, Zi Yan wrote:
> On 12 Jan 2022, at 6:04, David Hildenbrand wrote:
> 
>> On 05.01.22 22:47, Zi Yan wrote:
>>> From: Zi Yan <ziy@nvidia.com>
>>>
>>> alloc_migration_target() is used by alloc_contig_range() and non-LRU
>>> movable compound pages can be migrated. Current code does not allocate the
>>> right page size for such pages. Check THP precisely using
>>> is_transparent_huge() and add allocation support for non-LRU compound
>>> pages.
>>
>> IIRC, we don't have any non-lru migratable pages that are coumpound
>> pages. Read: not used and not supported :)
> 
> OK, but nothing prevents one writing a driver that allocates compound
> pages and provides address_space->migratepage() and address_space->isolate_page().
> 
> Actually, to test this series, I write a kernel module that allocates
> an order-10 page, gives it a fake address_space with migratepage() and
> isolate_page(), __SetPageMovable() on it, then call alloc_contig_range()
> on the page range. Apparently, my kernel module is not supported by
> the kernel, thus, I added this patch.
> 
> Do you have an alternative test to my kernel module, so that I do not
> even need this patch myself?
> 
>> Why is this required in the context of this series?
> 
> It might not be required. I will drop it.

That's why I think it would be best dropping it. If you need it in
different context, better submit it in different context.

Makes this series easier to digest :)


-- 
Thanks,

David / dhildenb

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
