Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4254E1091FB
	for <lists.iommu@lfdr.de>; Mon, 25 Nov 2019 17:36:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id CB4872010B;
	Mon, 25 Nov 2019 16:36:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8NilUJDL-y3q; Mon, 25 Nov 2019 16:36:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 46DCC20015;
	Mon, 25 Nov 2019 16:36:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2FBB7C0878;
	Mon, 25 Nov 2019 16:36:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C6946C0878
 for <iommu@lists.linux-foundation.org>; Mon, 25 Nov 2019 16:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C2F0686165
 for <iommu@lists.linux-foundation.org>; Mon, 25 Nov 2019 16:36:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uq-oREkjSPsv for <iommu@lists.linux-foundation.org>;
 Mon, 25 Nov 2019 16:36:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.82])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 51BE786141
 for <iommu@lists.linux-foundation.org>; Mon, 25 Nov 2019 16:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1574699793;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=7k/spbSE4Wnjsqc+UF1NKqt47ly0JC/Mr6Ef3iOR2Sc=;
 b=i0cI9REfcqE7yJy7kbJQkkiRvKWlVUk6irLLDaJNVbd/8wh4SJqvU8g3GBEgZSyC2J
 pDnVi+nvgoLrkCDlxoDgJS6ny7VaL7Y0LfYmcrgZLuwlm3IlqK7YMulcTZeGnmfoNOgv
 b0ZZRO/9Si5GcWqTbcXrAkGT1qUdFBgHr8D1L+RgLKUglP0vUkBBVxkFkMhH4wpKkyMI
 Rc0y+6vRC72ei0PaZ4Pdx8PKN38D437kBdONKHo8VlTBN7yCVDY1dXs3jbDGfjUHUGVq
 2Zw4wdhIu5q9VkIcClYyzldQmxBJJ8pWJhlb0WIobsEDzT6c4SgDtAUlnIYLcnSk9THY
 Dv1A==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPhXJixqXRlXNgnQNtnHeat+VHo="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a02:8109:89c0:ebfc:40cb:202:5c2:453d]
 by smtp.strato.de (RZmta 45.0.2 AUTH) with ESMTPSA id x0678cvAPGaH2b4
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Mon, 25 Nov 2019 17:36:17 +0100 (CET)
Subject: Re: Bug 205201 - Booting halts if Dawicontrol DC-2976 UW SCSI board
 installed, unless RAM size limited to 3500M
To: Christoph Hellwig <hch@lst.de>
References: <F1EBB706-73DF-430E-9020-C214EC8ED5DA@xenosoft.de>
 <20191121072943.GA24024@lst.de>
 <dbde2252-035e-6183-7897-43348e60647e@xenosoft.de>
 <6eec5c42-019c-a988-fc2a-cb804194683d@xenosoft.de>
 <d0252d29-7a03-20e1-ccd7-e12d906e4bdf@arm.com>
 <b3217742-2c0b-8447-c9ac-608b93265363@xenosoft.de>
 <20191121180226.GA3852@lst.de>
 <2fde79cf-875f-94e6-4a1b-f73ebb2e2c32@xenosoft.de>
 <20191125073923.GA30168@lst.de>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <96537365-8dbf-7f7e-f37f-14bf5c144b45@xenosoft.de>
Date: Mon, 25 Nov 2019 17:36:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191125073923.GA30168@lst.de>
Content-Language: de-DE
Cc: linux-arch@vger.kernel.org, darren@stevens-zone.net, rtd2@xtra.co.nz,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-kernel@vger.kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 paulus@samba.org, mad skateman <madskateman@gmail.com>,
 "contact@a-eon.com" <contact@a-eon.com>, Robin Murphy <robin.murphy@arm.com>,
 nsaenzjulienne@suse.de
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 25 November 2019 at 08:39 am, Christoph Hellwig wrote:
> On Sat, Nov 23, 2019 at 12:42:27PM +0100, Christian Zigotzky wrote:
>> Hello Christoph,
>>
>> Please find attached the dmesg of your Git kernel.
> Thanks.  It looks like on your platform the swiotlb buffer isn't
> actually addressable based on the bus dma mask limit, which is rather
> interesting.  swiotlb_init uses memblock_alloc_low to allocate the
> buffer, and I'll need some help from Mike and the powerpc maintainers
> to figure out how that select where to allocate the buffer from, and
> how we can move it to a lower address.  My gut feeling would be to try
> to do what arm64 does and define a new ARCH_LOW_ADDRESS_LIMIT, preferably
> without needing too much arch specific magic.
>
> As a quick hack can you try this patch on top of the tree from Friday?
>
> diff --git a/include/linux/memblock.h b/include/linux/memblock.h
> index f491690d54c6..e3f95c362922 100644
> --- a/include/linux/memblock.h
> +++ b/include/linux/memblock.h
> @@ -344,7 +344,7 @@ static inline int memblock_get_region_node(const struct memblock_region *r)
>   #define MEMBLOCK_LOW_LIMIT 0
>   
>   #ifndef ARCH_LOW_ADDRESS_LIMIT
> -#define ARCH_LOW_ADDRESS_LIMIT  0xffffffffUL
> +#define ARCH_LOW_ADDRESS_LIMIT  0x0fffffffUL
>   #endif
>   
>   phys_addr_t memblock_phys_alloc_range(phys_addr_t size, phys_addr_t align,
>
Hello Christoph,

Thanks a lot for your help! I will test your patch tomorrow.

Cheers,
Christian
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
