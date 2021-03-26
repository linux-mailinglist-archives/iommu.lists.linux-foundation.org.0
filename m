Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B5C34AC51
	for <lists.iommu@lfdr.de>; Fri, 26 Mar 2021 17:11:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86AAD84B48;
	Fri, 26 Mar 2021 16:10:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E5ZcDDu2fLUN; Fri, 26 Mar 2021 16:10:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97C6A84B07;
	Fri, 26 Mar 2021 16:10:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 73391C000A;
	Fri, 26 Mar 2021 16:10:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1E146C000A
 for <iommu@lists.linux-foundation.org>; Fri, 26 Mar 2021 16:10:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 09B3141460
 for <iommu@lists.linux-foundation.org>; Fri, 26 Mar 2021 16:10:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=svenpeter.dev header.b="bWJPooEI";
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.b="aaZt7fpn"
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w59lGivN4U45 for <iommu@lists.linux-foundation.org>;
 Fri, 26 Mar 2021 16:10:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1147340F3E
 for <iommu@lists.linux-foundation.org>; Fri, 26 Mar 2021 16:10:55 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id E57C058081B;
 Fri, 26 Mar 2021 12:10:51 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
 by compute3.internal (MEProxy); Fri, 26 Mar 2021 12:10:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
 h=mime-version:message-id:in-reply-to:references:date:from:to
 :cc:subject:content-type; s=fm1; bh=ydSKVsbgvF7jbPFgx/6CxB2ZQoad
 D/zDEYXlE4rQ4+M=; b=bWJPooEIpn0MwMMFQLSn7CNEsyRZ458l39Bvcp2b+FkU
 U014axn4wWCyjs55Q7ppwoNE7X/zYkICbiLxgElKTVJA2uHsZpyW7F8RfPoncuDa
 pmUYLbgHcPyX/Kheu4DVLyYokUM4j/Wjkl79GT8QEzM+q9GKXz9ZftP88bLZfdtk
 QCsHvqBfA/BK5pYfS5Tt4l/k0NcFqJe+DXSo21qElqUD6OxRDRqqWdP6+SyI+Zg7
 1VomAkHicAVg1XoMeLR4ma18uVhB9rVFZAy09XlwRpEXdh2U+R1utWVY8XPSqpML
 nDL3r6hxlc/8DNw8CDFwSSXNKL5WorBG8EbUo1NebA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ydSKVs
 bgvF7jbPFgx/6CxB2ZQoadD/zDEYXlE4rQ4+M=; b=aaZt7fpnHn+6HG7GPQd/fK
 HwGycVf+4SgEU0/WXqVzn5JcSoQOAarNNqRKjCmnqkdQq/lo2u+XEKfh8O8fv9px
 wMEH/2MH7ToF2Nr3j0vwySALiYQhEdfNhmU1hHrr2eugol1ukbyoLrjM4V/ycO+D
 eAYuSRZgZ3AI9FKUxBu1QLgteow4eS8V+lnDKhcMCmQmFT9uWpETtGiaxjDyCMkG
 n9Qt8r3FbLyoceP/xrzu9gDRxAC7lgiC4OU13uvVHgHomFKU+y9FZKv/gvLWyVeX
 gfC0bb39ajLK0q7y1nYMHrpicPimy3DfQL/c4Ouyrc7QqnF0eiGA73qFEjLJ37Sg
 ==
X-ME-Sender: <xms:iQdeYLsHrDgf--H1Ek0pQghFMA_VQX-u5b3OL_J_KgXbf0TyoynUYw>
 <xme:iQdeYMdoi0KjqAmitX98JooDnmkGC5_JewtKz3WkTl-cRm-rMAwcUUhNqvxQbBLMb
 _ikKr0Eg7I7EKAgfEY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudehvddgkeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdfuvhgv
 nhcurfgvthgvrhdfuceoshhvvghnsehsvhgvnhhpvghtvghrrdguvghvqeenucggtffrrg
 htthgvrhhnpefgieegieffuefhtedtjefgteejteefleefgfefgfdvvddtgffhffduhedv
 feekffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hsvhgvnhesshhvvghnphgvthgvrhdruggvvh
X-ME-Proxy: <xmx:iQdeYOy-UrYEpxUk7FignU1Cb6nqOly_ZDnv3s-jPoHWDJH6h7mMiQ>
 <xmx:iQdeYKO-NuchSDfCle5TT0KH8p2JRm7k2ZeeSVlQ_nbculalqOYd6A>
 <xmx:iQdeYL9hHfaQBRCifL1hKSHYCHwd7ahPLTlnD5ctFf__lRh4Hp1_4g>
 <xmx:iwdeYKVaB1qgxIudhtH2B9dKQ5zQKK6ZQKI4wheTo_m5qC2e2jhprSieqTA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 6BB4451C005E; Fri, 26 Mar 2021 12:10:49 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-273-g8500d2492d-fm-20210323.002-g8500d249
Mime-Version: 1.0
Message-Id: <9f06872d-f0ec-43c3-9b53-d144337100b3@www.fastmail.com>
In-Reply-To: <c1bcd90d344c2b68@bloch.sibelius.xs4all.nl>
References: <20210320151903.60759-1-sven@svenpeter.dev>
 <c1bcc0609e920bc6@bloch.sibelius.xs4all.nl>
 <20210323205346.GA1283560@robh.at.kernel.org>
 <43685c67-6d9c-4e72-b320-0462c2273bf0@www.fastmail.com>
 <CAK8P3a0fvnYLrG=cGiOQ6u8aZnriTeM0R=MW7FX=94mO13Rq0w@mail.gmail.com>
 <c1bcd90d344c2b68@bloch.sibelius.xs4all.nl>
Date: Fri, 26 Mar 2021 17:10:29 +0100
To: "Mark Kettenis" <mark.kettenis@xs4all.nl>,
 "Arnd Bergmann" <arnd@kernel.org>
Subject: Re: [PATCH 0/3] Apple M1 DART IOMMU driver
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, Hector Martin <marcan@marcan.st>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Marc Zyngier <maz@kernel.org>, mohamed.mediouni@caramail.com,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 stan@corellium.com
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
From: Sven Peter via iommu <iommu@lists.linux-foundation.org>
Reply-To: Sven Peter <sven@svenpeter.dev>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>



On Fri, Mar 26, 2021, at 16:59, Mark Kettenis wrote:
> Some of the DARTs provide a bypass facility.  That code make using the
> standard "dma-ranges" property tricky.  That property would need to
> contain the bypass address range.  But that would mean that if the
> DART driver needs to look at that property to figure out the address
> range that supports translation it will need to be able to distinguish
> between the translatable address range and the bypass address range.

Do we understand if and why we even need to bypass certain streams?
And do you have an example for a node in the ADT that contains this bypass range?

I've only seen nodes with "bypass" and "bypass-adress" but that could just be
some software abstraction Apple uses which doesn't map well to Linux or other OSes
and might not even be required here.


Sven

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
