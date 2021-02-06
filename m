Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC77311820
	for <lists.iommu@lfdr.de>; Sat,  6 Feb 2021 02:44:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 67A6486DB2;
	Sat,  6 Feb 2021 01:44:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2CC2FEG737wQ; Sat,  6 Feb 2021 01:44:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A0C5386C39;
	Sat,  6 Feb 2021 01:44:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 75BB7C1DA9;
	Sat,  6 Feb 2021 01:44:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2339DC013A
 for <iommu@lists.linux-foundation.org>; Sat,  6 Feb 2021 01:44:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id EB869203D7
 for <iommu@lists.linux-foundation.org>; Sat,  6 Feb 2021 01:44:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iq-MHh80jnwp for <iommu@lists.linux-foundation.org>;
 Sat,  6 Feb 2021 01:44:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 0C262203D4
 for <iommu@lists.linux-foundation.org>; Sat,  6 Feb 2021 01:44:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4EAFA6501F;
 Sat,  6 Feb 2021 01:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612575869;
 bh=jmN/BJJyusBTY7HcnIzNhI5cscbo4CoEanczIcEFk28=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=Ca8bIP6A5ATAUuQr2JFEMUAnaplAUwkp6VYxYSMVRQiE3OaFddS6eM/0Q3JcMklbe
 ECbYzMDBL0y7YTcY1HJETuif/vSkQ7NPJtH1dxBWL97zu0+lveKnHEL0CR6JE32rfa
 4OFovkej92ZQwlDw6yOpgEz6X7pW6TfKSVvHtmVgfD7z+00f63bc41qQhsspODD5vW
 ZQe8qVQg590LgwX9x3OqosiwtjUyoSN9Jy1VOBKysBZVgPfd5WUsrgDyJmzjRHP6aR
 1WXlJoEJIpNvbFgVrflH0Rj+elF+rgpZKNSefVMbCIhq+IfVV0o2YtrMz6CoT4kZsI
 NaTgzKibTiQLQ==
MIME-Version: 1.0
In-Reply-To: <20210202205544.24812-1-robh@kernel.org>
References: <20210202205544.24812-1-robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: Fix undocumented compatible strings in
 examples
From: Stephen Boyd <sboyd@kernel.org>
To: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Date: Fri, 05 Feb 2021 17:44:28 -0800
Message-ID: <161257586802.76967.16227347834240151587@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Cc: Tomer Maimon <tmaimon77@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Vincent Cheng <vincent.cheng.xh@renesas.com>,
 Tali Perry <tali.perry1@gmail.com>, Daniel Palmer <daniel@thingy.jp>,
 linux-i2c@vger.kernel.org, Will Deacon <will@kernel.org>,
 linux-clk@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
 Joel Stanley <joel@jms.id.au>, Guenter Roeck <linux@roeck-us.net>,
 linux-watchdog@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 linux-gpio@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Avi Fishman <avifishman70@gmail.com>, linux-kernel@vger.kernel.org,
 Andrew Jeffery <andrew@aj.id.au>, iommu@lists.linux-foundation.org,
 linux-crypto@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
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

Quoting Rob Herring (2021-02-02 12:55:42)
> Running 'dt-validate -m' will flag any compatible strings missing a schema.
> Fix all the errors found in DT binding examples. Most of these are just
> typos.
> 
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Herbert Xu <herbert@gondor.apana.org.au>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Daniel Palmer <daniel@thingy.jp>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: Avi Fishman <avifishman70@gmail.com>
> Cc: Tomer Maimon <tmaimon77@gmail.com>
> Cc: Tali Perry <tali.perry1@gmail.com>
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Cc: Vincent Cheng <vincent.cheng.xh@renesas.com>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-crypto@vger.kernel.org
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-i2c@vger.kernel.org
> Cc: iommu@lists.linux-foundation.org
> Cc: linux-watchdog@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
