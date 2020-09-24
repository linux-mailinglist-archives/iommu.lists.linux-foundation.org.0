Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 987EE276C4B
	for <lists.iommu@lfdr.de>; Thu, 24 Sep 2020 10:46:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5513086B79;
	Thu, 24 Sep 2020 08:46:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VZBpnCrINtpr; Thu, 24 Sep 2020 08:46:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 359F886B78;
	Thu, 24 Sep 2020 08:46:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1A14CC0051;
	Thu, 24 Sep 2020 08:46:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 657C2C0051
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 08:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4B70087388
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 08:46:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OVGxZinoOOY3 for <iommu@lists.linux-foundation.org>;
 Thu, 24 Sep 2020 08:46:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 553708737F
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 08:46:50 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200924084648euoutp015d1cee92b135a6c853150afbfb71b025~3q_ikKrT31627516275euoutp01K
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 08:46:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200924084648euoutp015d1cee92b135a6c853150afbfb71b025~3q_ikKrT31627516275euoutp01K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1600937208;
 bh=IleVHOrHvQEl9U+hsiKsloVKJmUMhb9aM6PxzqPwaqE=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=J+kEIyE8rn15jVFb+W5i2+2DSIv2CRGktvtSlflnM9AG4wXqqYJFVL4eoUQXVCArl
 jVm8C9hyBFsWbwN52HC+IWo0zRRdXMeT7LDrcyN/EbmAy8dweD2F+Bfgl0Ob/m3BPZ
 I7dt+SWaCu0Axmr/QmCSMdFSWNoPGsgJ1fM42NJI=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200924084647eucas1p15badd906ac0baf0f4436f797c5e341ea~3q_iUZ27L2780427804eucas1p1F;
 Thu, 24 Sep 2020 08:46:47 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id BE.8C.06318.7FC5C6F5; Thu, 24
 Sep 2020 09:46:47 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200924084647eucas1p1e5396acc2294f327968541e48b63cedc~3q_iA9Ei30261302613eucas1p1L;
 Thu, 24 Sep 2020 08:46:47 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200924084647eusmtrp1b19fafcb86f86f546543c88622c0bdde~3q_iALkCu2654426544eusmtrp1J;
 Thu, 24 Sep 2020 08:46:47 +0000 (GMT)
X-AuditID: cbfec7f5-38bff700000018ae-11-5f6c5cf79251
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id B8.1C.06314.7FC5C6F5; Thu, 24
 Sep 2020 09:46:47 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200924084646eusmtip1f2d1f1c422cbea1045313fa08a045acf~3q_hOcHdD1025210252eusmtip1S;
 Thu, 24 Sep 2020 08:46:46 +0000 (GMT)
Subject: Re: IOVA allocation dependency between firmware buffer and
 remaining buffers
To: Joerg Roedel <joro@8bytes.org>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <37e767b8-8ec4-ae80-ea0d-1caf3cdab8fa@samsung.com>
Date: Thu, 24 Sep 2020 10:46:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200924082830.GB27174@8bytes.org>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01SeUiTYRjn3Xfsczl5nYUPlRWjg6KVYslHhVREfVB0UGBKHiu/VLxq0y4I
 Rhe1zGpG5apl9Yc2zabNY2qHSx26FNGslVfW0pTUbrWy4/Pr8L/f9bzP84OXIRQvqMlMXFIK
 r0lSJyhpGVlcM9KgGtqWEOnfawliLW+vEeyds0U0ezO3WsJm3V/K6nIbKfbEJYuU7cj7SbE9
 14YJtvKdm2KrusqlbL7NIGVHykwke6Rt8XI55640Sbg8Ux7ibMZ2KVdoPkFzhR8MUq7tSQXN
 mWo3cRmubMSVP9PRXLrVjDbKwmTLovmEuD28ZmFwlCx2sL1fsuu1x76cwQsSHeqV6pEHA3gR
 nLTXE3okYxQ4B0FZn4MSyScE1i4nLZKPCHIyDv0bMZWOkqKRjcDY0kMJhgIP/p7v9tIjhvHB
 IWCvCBfkiVgJTz8eHXuVwKcIyG5NkwgGjQNA36+nBSzHwXC32kYKmMSz4GxVASHgSTgCaupe
 kmLGG2oz3WPYA/uDtdM8dhCBp0NJ/2VCxL7w3H1VIiwDPCqFh81fKPHqVdCUXSMRsQ/0Oax/
 2kwFZ0YaKQ4cRtDVcEsqkjQEzYcuIjG1FNoavtJCNQLPhdtlC0V5Bbx8X0IKMmAvcPV7i0d4
 gaH4AiHKcjh+TCGmZ4PRkf9vbWVjE3EGKY3jqhnH1TGOq2P8vzcLkWbky6dqE2N4bWASv3eB
 Vp2oTU2KWbAjObEQ/f53zh+Oz6Xo3vftdoQZpPSUM6r4SAWl3qPdn2hHwBDKifKV9c4IhTxa
 vf8Ar0mO1KQm8Fo7msKQSl954PXecAWOUafw8Ty/i9f8dSWMx2QdWu+aceXVvtuew1Gh3ztC
 Kr4uuf40+lKwjTVHjioe2S1EuSH/jbN7fpGPyrk2ak7raN6GTMvqxzcycgviww5O29L3zfUt
 vXgk1NVycqtf70DdXGt6R9uDTmrCgKppSJcVXzateI2zPdO6e3q3d3qp4ViH97l1QX7rbe6Z
 OzdHnN7ueV5JamPVAfMIjVb9C2GlWERzAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrCIsWRmVeSWpSXmKPExsVy+t/xu7rfY3LiDb41KVpseLOQ2WLzxK1s
 FitXH2WyWLDf2qJh9QVWi87ZG9gt7q35z2rxfOEPZouDH56wWhx5uJvdYt3OSewWP3fNY7Fo
 uWPqwOvx5OA8Jo8189YweuycdZfdY9OqTjaPTZ8msXvcubaHzWPeyUCPyTeWM3rsvtnA5tG3
 ZRVjAFeUnk1RfmlJqkJGfnGJrVK0oYWRnqGlhZ6RiaWeobF5rJWRqZK+nU1Kak5mWWqRvl2C
 Xsb7u2+ZCp5yVqx4P52pgfElexcjJ4eEgInEvB1/WboYuTiEBJYySmz7dIgFIiEjcXJaAyuE
 LSzx51oXG0TRW0aJOUdWgXULC4RLbNs4B6xIREBJ4vrnVlaQImaBXmaJjt/HocbuY5a4d+Yd
 WBWbgKFE11uQUZwcvAJ2EnuP7gRbxyKgKjHxyEZmEFtUIE7iTM8LqBpBiZMzn4DVcAoYSGy5
 D7GZWcBMYt7mh8wQtrzE9rdzoGxxiVtP5jNNYBSahaR9FpKWWUhaZiFpWcDIsopRJLW0ODc9
 t9hQrzgxt7g0L10vOT93EyMwxrcd+7l5B+OljcGHGAU4GJV4eDl0s+OFWBPLiitzDzFKcDAr
 ifA6nT0dJ8SbklhZlVqUH19UmpNafIjRFOi5icxSosn5wPSTVxJvaGpobmFpaG5sbmxmoSTO
 2yFwMEZIID2xJDU7NbUgtQimj4mDU6qBUVY4a9rBGZwvatvufupl9Q6cePWje8+vvue7/lpd
 v7/KfaIJvwzHiyytcj7vI+c/XC7r+th8Z85jDjM5nrn3N9kfXeyw5ewkzwpbxum8Ae2d/hPf
 6T6sDEl9cUMsOZvR/8xlgcA/Kxqu5hhN3fZp76yFpx99tXh+mZPLwP6S/Nn0B6qMEjpebUos
 xRmJhlrMRcWJANsUbNwHAwAA
X-CMS-MailID: 20200924084647eucas1p1e5396acc2294f327968541e48b63cedc
X-Msg-Generator: CA
X-RootMTR: 20200424161534eucas1p29177cad5b4790d392acb69a335a3992e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200424161534eucas1p29177cad5b4790d392acb69a335a3992e
References: <CAEC9eQOX9BHX4v5aY2cfCT=T-ZHA7y0xF7aiZhW9xzG4fme36Q@mail.gmail.com>
 <CAEC9eQPaeF9=Li74x9RrSHyDgRZ6b653yBRu6EYsaU+eSj2wsQ@mail.gmail.com>
 <59cda41f-170c-a1ad-a345-bc38b9ed4d73@arm.com>
 <CGME20200424161534eucas1p29177cad5b4790d392acb69a335a3992e@eucas1p2.samsung.com>
 <CAOD6ATrWYLPT0ydz2vFhNwWhqHum_q_pyCe=oGJWOcEqjmNOqQ@mail.gmail.com>
 <11584d09-5995-6133-3bd3-8f7a0afd0e01@samsung.com>
 <20200924082830.GB27174@8bytes.org>
Cc: jean-philippe@linaro.org, will@kernel.org, linux-mm@kvack.org,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 Thierry Reding <thierry.reding@gmail.com>, Ajay kumar <ajaynumb@gmail.com>,
 Shaik Ameer Basha <shaik.ameer@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, hch@lst.de
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

Hi Joerg,

On 24.09.2020 10:28, Joerg Roedel wrote:
> On Wed, Sep 23, 2020 at 08:48:26AM +0200, Marek Szyprowski wrote:
>> It allows to remap given buffer at the specific IOVA address, although
>> it doesn't guarantee that those specific addresses won't be later used
>> by the IOVA allocator. Probably it would make sense to add an API for
>> generic IOMMU-DMA framework to mark the given IOVA range as
>> reserved/unused to protect them.
> There is an API for that, the IOMMU driver can return IOVA reserved
> regions per device and the IOMMU core code will take care of mapping
> these regions and reserving them in the IOVA allocator, so that
> DMA-IOMMU code will not use it for allocations.
>
> Have a look at the iommu_ops->get_resv_regions() and
> iommu_ops->put_resv_regions().

I know about the reserved regions IOMMU API, but the main problem here, 
in case of Exynos, is that those reserved regions won't be created by 
the IOMMU driver but by the IOMMU client device. It is just a result how 
the media drivers manages their IOVA space. They simply have to load 
firmware at the IOVA address lower than the any address of the used 
buffers.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
