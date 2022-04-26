Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CAC510A5A
	for <lists.iommu@lfdr.de>; Tue, 26 Apr 2022 22:22:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 44E8840BA1;
	Tue, 26 Apr 2022 20:22:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LLGdTHnZqqH3; Tue, 26 Apr 2022 20:22:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B54C340ABA;
	Tue, 26 Apr 2022 20:22:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 844BFC002D;
	Tue, 26 Apr 2022 20:22:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6D437C002D
 for <iommu@lists.linux-foundation.org>; Tue, 26 Apr 2022 20:22:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B47E83E17
 for <iommu@lists.linux-foundation.org>; Tue, 26 Apr 2022 20:22:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=svenpeter.dev header.b="yC+vjIVy";
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.b="j+A319KT"
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aqAvAmLMFdAY for <iommu@lists.linux-foundation.org>;
 Tue, 26 Apr 2022 20:22:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 84B3981AEA
 for <iommu@lists.linux-foundation.org>; Tue, 26 Apr 2022 20:22:32 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 794575C00F8;
 Tue, 26 Apr 2022 16:22:26 -0400 (EDT)
Received: from imap47 ([10.202.2.97])
 by compute2.internal (MEProxy); Tue, 26 Apr 2022 16:22:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1651004546; x=
 1651090946; bh=U9DAiEYbrUd9tFuzbQeFQ00nB7pzlike5TcMqRrzras=; b=y
 C+vjIVy2d9e7Sp46ooWs2Kf2JARy6m6H0M3Xd867jqFUFrWAub+aj7SmwPvDRvls
 1DHyHII593Q4xvg4Xy2tMprzaDtRY2ZkIFmeWOhKe0+MFXAVSJfxQIEFXjaer0yQ
 41QVqTL3P2wgPbde/8FgEnD/EF/aCeXOQp3Ip8ZxHT8TS21nm9z5kIfGiKZRifau
 JbQgApmxegzLS83kaQkNkL1STmnPP3YkFHu6D8Yvi1Jk0HnSuQvAEAgykmKH5uGX
 oEDZY90QlHxxv9EGEH7kGoNXBg3FNYrTS0NCYQ66bDNivt71VkzjkvDJZg1xa44z
 qc8ULf5+Q02xvSWoh799w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1651004546; x=1651090946; bh=U9DAiEYbrUd9t
 FuzbQeFQ00nB7pzlike5TcMqRrzras=; b=j+A319KTz1azrMQcygW79Tcn4Ddw5
 mZulvNtYgdmTUoanzc5l51g0ypyiFKmJbgBQ7jTvgwemimfZhnt+8+M4aNyCPzoh
 BraX414CEZ/UBPmHexd9g75WKbpGdaqCTqJ04YstqKUTpYP3KEMl9Q2adYVRN/sI
 njmyc0Ocdkr448o9YI6pQrRl9u4zPNbbBkZhnOi6bsMS052eJ3JxbY/So1rgNaHG
 y6NqX1+lmlNgO2/oG3bBcLtxWCdaP88KRnJKHgeoR6hzP1K7DAC5lqxc2W4tU31U
 JYeP6V17IpwfNz2Z1c7TNDTrBBAXSoUwDJZSqYZVe4IYh3KIELKkHoT4g==
X-ME-Sender: <xms:glRoYmodjwDNvmGDa35FjUFlQPXq83CoAqUbnSTt96mWpQ_18fpNqg>
 <xme:glRoYkreCiM1QpemYhhbqyZRBp7FQBuvt4L8qd0vqXS4nM6BVbNQCfGVAcv0BS7Lc
 nrTbkSRO4t0anZL9pM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefgddugeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqmhdtreerjeenucfhrhhomhepfdfu
 vhgvnhcurfgvthgvrhdfuceoshhvvghnsehsvhgvnhhpvghtvghrrdguvghvqeenucggtf
 frrghtthgvrhhnpefgveevteefveekteffhfejgfevheetffejgeehgfejfeetledtjeeg
 ffejuefhveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehsvhgvnhesshhvvghnphgvthgvrhdruggvvh
X-ME-Proxy: <xmx:glRoYrN5775Q-CR_QU48q5IRHrJ9ByH9CeEY0wHccIgLvtlKC1_Cqg>
 <xmx:glRoYl4PNSOrAJ5wdxdaS7y93-L7fzKw9FZj6KJmdhlJ4TQ_viHWVQ>
 <xmx:glRoYl7DUZRp-zsynnA3WOms__9DpU4DwFH8QBugJFUavUiMyHM0ZA>
 <xmx:glRoYvk3RVBa0YdwTyM7xGUQC8Rc7dB0MBygEbsTkqlEqQrbcFNG9g>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 014402740386; Tue, 26 Apr 2022 16:22:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-569-g7622ad95cc-fm-20220421.002-g7622ad95
Mime-Version: 1.0
Message-Id: <FCB9C443-0A57-4E8D-AF13-A61F80861A4F@svenpeter.dev>
In-Reply-To: <20220425090826.2532165-1-yangyingliang@huawei.com>
References: <20220425090826.2532165-1-yangyingliang@huawei.com>
Date: Tue, 26 Apr 2022 22:22:05 +0200
To: "Yang Yingliang" <yangyingliang@huawei.com>
Subject: Re: [PATCH] iommu/dart: check return value after calling
 platform_get_resource()
Cc: iommu@lists.linux-foundation.org, will@kernel.org,
 linux-kernel@vger.kernel.org, alyssa@rosenzweig.io
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

PiBPbiAyNS4gQXByIDIwMjIsIGF0IDEwOjU2LCBZYW5nIFlpbmdsaWFuZyA8eWFuZ3lpbmdsaWFu
Z0BodWF3ZWkuY29tPiB3cm90ZToKPiAKPiDvu79JdCB3aWxsIGNhdXNlIG51bGwtcHRyLWRlcmVm
IGluIHJlc291cmNlX3NpemUoKSwgaWYgcGxhdGZvcm1fZ2V0X3Jlc291cmNlKCkKPiByZXR1cm5z
IE5VTEwsIG1vdmUgY2FsbGluZyByZXNvdXJjZV9zaXplKCkgYWZ0ZXIgZGV2bV9pb3JlbWFwX3Jl
c291cmNlKCkgdGhhdAo+IHdpbGwgY2hlY2sgJ3JlcycgdG8gYXZvaWQgbnVsbC1wdHItZGVyZWYu
Cj4gQW5kIHVzZSBkZXZtX3BsYXRmb3JtX2dldF9hbmRfaW9yZW1hcF9yZXNvdXJjZSgpIHRvIHNp
bXBsaWZ5IGNvZGUuCj4gCj4gRml4ZXM6IDQ2ZDFmYjA3MmU3NiAoImlvbW11L2RhcnQ6IEFkZCBE
QVJUIGlvbW11IGRyaXZlciIpCj4gU2lnbmVkLW9mZi1ieTogWWFuZyBZaW5nbGlhbmcgPHlhbmd5
aW5nbGlhbmdAaHVhd2VpLmNvbT4KClJldmlld2VkLWJ5OiBTdmVuIFBldGVyIDxzdmVuQHN2ZW5w
ZXRlci5kZXY+CgoKVGhhbmtzLAoKU3ZlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KaW9tbXUgbWFpbGluZyBsaXN0CmlvbW11QGxpc3RzLmxpbnV4LWZv
dW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2lvbW11
