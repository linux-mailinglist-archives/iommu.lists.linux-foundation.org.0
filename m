Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 447C53CB36B
	for <lists.iommu@lfdr.de>; Fri, 16 Jul 2021 09:41:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38705843A1;
	Fri, 16 Jul 2021 07:41:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BW9CoCztcjhk; Fri, 16 Jul 2021 07:41:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3B693843A0;
	Fri, 16 Jul 2021 07:41:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EAA75C001F;
	Fri, 16 Jul 2021 07:41:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C0E42C000E
 for <iommu@lists.linux-foundation.org>; Fri, 16 Jul 2021 07:41:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99EC8606F6
 for <iommu@lists.linux-foundation.org>; Fri, 16 Jul 2021 07:41:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=cerno.tech header.b="jrQzRcir";
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.b="MukbA9/q"
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SGGGgTzgblRR for <iommu@lists.linux-foundation.org>;
 Fri, 16 Jul 2021 07:41:01 +0000 (UTC)
X-Greylist: delayed 00:09:09 by SQLgrey-1.8.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 56287605F7
 for <iommu@lists.linux-foundation.org>; Fri, 16 Jul 2021 07:41:01 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 6A99E5C005F;
 Fri, 16 Jul 2021 03:31:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 16 Jul 2021 03:31:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=9
 q7nhrRhL96am75SGaSvOxEEm6JigHfcUYmu7xTlFV8=; b=jrQzRcir9ZP1z5EDU
 QduO1jKVBdynDvmqXQm7rRAAP7/SMSBMA9l3/64vFWiiSdzb2B/XgvchEBsDvA7m
 ONeBCQEgYOMEr2USlLtiEaZ2AUkikXRkrJR0bwVaOm2KmDHSzDjaqJSgDzOqfZeC
 WNbnEbpITNJw7G18jmLAy0hokzSz7t7oCSHhcIlIxPQMYpXO5kCJD2vCsCNBL4J0
 m391NSYs20yFO0ROXb7dVPOLoHHBIZiuFAXPzB440DKP9avLHq919/vExeHRKitZ
 4y9EGfmxrxQEpjMEyx9Iu4Hky0ChrC2yWOOzmtkZuSy4hkEahDYP06Ik9drvooV9
 Ql3nQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=9q7nhrRhL96am75SGaSvOxEEm6JigHfcUYmu7xTlF
 V8=; b=MukbA9/qx+NaEa7CTyYCI9IXfsI0mds3znhfWZOLQ627I6rvfd1NRO3Ds
 JcwepO6pv/PJt4OGJwQfHzO+JDacb7UMKxMAFn7NUtVwiBqyrcmrjMVEaBQAbOhV
 wpiTMD6tfk1GBZTdxTQxYFqE67hi8l+4q3x2DhYuKeRMBFlwi/UETSJkVIPWezex
 PZ8Kt6kdXd/9TboGu6OUJGRJVEoZylb+sGc5N/cpSQlCXRUX0ZPMFXr7ZIq8Fkqq
 k9DUeYM3Ar0cazMV0RVlybrf3EHdK5AG6nV8nI9+77l/87T7jvMb32qeju7Niv+y
 s/KRuKhfrZ4B11D9ljagXqwFYdlPg==
X-ME-Sender: <xms:4zXxYI591YjJ6as-P0zxliNF6sA1GhfnhkJBvKMomNmOhR6iVfXPFw>
 <xme:4zXxYJ4lkjyDgi0zWGnOLm_AyCCZ6GHQbxreLQKJqXOb69neqWqE9elna2pa4R_37
 FqeeS4lebCbojA2FxQ>
X-ME-Received: <xmr:4zXxYHdQDsF_q-ThqfcdFZjWj3puptZ3Bj5XGlUJuPRsc5bTSk8SmBMPFGEbpHr1_6VulYbQU3OUZH9JCgVM-Ff6merF64mbBD0u>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvgdduudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpefgjeettdejgffgffdvteeutdehtdehgeehueetkeefgefhtdetjeekledu
 gedvudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:4zXxYNKY-rOhvpGVNL0GNZhYtVWwI_OeNVIb-d1t5kceSEtXfOjYkg>
 <xmx:4zXxYMKB2wCyIA14IPs7wQ9AspuXR5mlTap7-8m3KCcPRn_2wz6vCg>
 <xmx:4zXxYOwnye-tmyjMRPvWsYY8kH6M9TizUCg01Lcm-5hI4QL9IbwX1A>
 <xmx:5DXxYGgs6Xes9EohJJFP5RG5Saim9YIk7yAZeLyDM2LgsqknfwvX9A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 16 Jul 2021 03:31:47 -0400 (EDT)
Date: Fri, 16 Jul 2021 09:31:46 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH] iommu/sun50i: fix protection flag check
Message-ID: <20210716073146.3qskhbwzr427g5xe@gilmour>
References: <20210716042431.3195155-1-stevensd@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210716042431.3195155-1-stevensd@google.com>
Cc: iommu@lists.linux-foundation.org, linux-sunxi@lists.linux.dev
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

On Fri, Jul 16, 2021 at 01:24:31PM +0900, David Stevens wrote:
> From: David Stevens <stevensd@chromium.org>
> 
> Fix RW protection check when making a pte, so that it properly checks
> that both R and W flags are set, instead of either R or W.
> 
> Signed-off-by: David Stevens <stevensd@chromium.org>

Acked-by: Maxime Ripard <maxime@cerno.tech>

Thanks!
Maxime
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
