Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0031F1E1C98
	for <lists.iommu@lfdr.de>; Tue, 26 May 2020 09:56:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6CEA186AB6;
	Tue, 26 May 2020 07:56:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KWhKjORc8lWm; Tue, 26 May 2020 07:56:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2436186A70;
	Tue, 26 May 2020 07:56:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EF430C016F;
	Tue, 26 May 2020 07:56:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DB574C016F
 for <iommu@lists.linux-foundation.org>; Tue, 26 May 2020 07:56:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B49C6204C0
 for <iommu@lists.linux-foundation.org>; Tue, 26 May 2020 07:56:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4DC-Lc4Fg9pu for <iommu@lists.linux-foundation.org>;
 Tue, 26 May 2020 07:56:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by silver.osuosl.org (Postfix) with ESMTPS id 14E79203A6
 for <iommu@lists.linux-foundation.org>; Tue, 26 May 2020 07:56:38 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E90A95C0058;
 Tue, 26 May 2020 03:56:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 26 May 2020 03:56:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm2; bh=Z
 u9qqU+I+thjV7ih0gjMq+r1LnUk7vFMdi7Yew8UXJA=; b=xneF9++arCV/I77rR
 8tDgoctxQlEU8NQEX4Ez381uoRVlHrFxRnwUQt6j/dmP6Tz8QrKj9xh5oi+qGkf7
 7CLIYDqQ50alvXSblYSOK35/JoV/lycqKEVACaq07FM1XhYkpvld9OKDf/T/nPIX
 oMstbQijFskdWwMkeXr/L2Fnmx/NYkholzSYmB/zk3JRxq7ZopMK+ZAuxGOx9sg8
 mCq6aiv4ZETpLj26t5tOZPj5jQii2pHk7fvadHK1pjYXIK78++k/8Tt+BbMH++3h
 7EErQaTF1K5uUuSQwYOnu2tyg9OvX8rmlI8SaZrEx1Slq9L911h5oOyeS1SglYLp
 fVUzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=Zu9qqU+I+thjV7ih0gjMq+r1LnUk7vFMdi7Yew8UX
 JA=; b=p0cu4g70VqbywSbgNEoJJGrVh0fks3lfYnbqF9+Dt5jSYkkdic/bllsTh
 O77J/jq4X9lj2+sAWxFz++C7TzM2ywsTdVLknidD6RSBd1EpubjQWs3WLfG+Z3sm
 1uPZ0UDxrl9ndLRGaUxZ9lIRmtBR7jWDaUnO95RPsbBhVgo/3BKz/A9/MJH3imaG
 fmPXLLginST6wZlqGI1y9Ip4j96L2TPbclo22ejhobOsAGAW9xGlzdqn5We3osZ6
 GTOOr4sFK35zy3jbiTbFHO5hwrAbhp/2Ida66TJgNMpP9x4I8iIHiAoelkRHfJVc
 yxlj9AyEOox/5lmzjM4IVsdnB96qA==
X-ME-Sender: <xms:scvMXtW6yirSIt1uH7W78oOy4M0e6wqkOFer8qkJJ2MiaZMPRuFJ2A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvuddguddvvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepgfejtedtjefggfffvdetuedthedtheegheeuteekfeeghfdtteejkeel
 udegvddunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:scvMXtkGf5broUr6pAbTdzLfNgFpIixxtsz-1ba5es1lu3Sy8OiVXA>
 <xmx:scvMXpY4qalIlkQ9EWDOhnvEhEoTtynFhThong14ufMKt6lp0SZrYA>
 <xmx:scvMXgVID8mORfqJf9rT0xHxW6GJ7TqUIm3trViClXYj0w8pmMOhJQ>
 <xmx:tcvMXsyv-p5n67fNuL0DwsQ7uh4PB8z8SzI0caVkb1jgVU5OHgqEQA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id E28AD328005E;
 Tue, 26 May 2020 03:56:32 -0400 (EDT)
Date: Tue, 26 May 2020 09:56:30 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: Re: [PATCH 2/2] iommu/sun50i: Constify sun50i_iommu_ops
Message-ID: <20200526075630.wjevamadh5mcnleb@gilmour.lan>
References: <20200525214958.30015-1-rikard.falkeborn@gmail.com>
 <20200525214958.30015-3-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200525214958.30015-3-rikard.falkeborn@gmail.com>
Cc: Chen-Yu Tsai <wens@csie.org>, iommu@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Mon, May 25, 2020 at 11:49:58PM +0200, Rikard Falkeborn wrote:
> The struct sun50i_iommu_ops is not modified and can be made const to
> allow the compiler to put it in read-only memory.
> 
> Before:
>    text    data     bss     dec     hex filename
>   14358    2501      64   16923    421b drivers/iommu/sun50i-iommu.o
> 
> After:
>    text    data     bss     dec     hex filename
>   14726    2117      64   16907    420b drivers/iommu/sun50i-iommu.o
> 
> Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
