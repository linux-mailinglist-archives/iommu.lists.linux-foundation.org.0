Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D04E62B9033
	for <lists.iommu@lfdr.de>; Thu, 19 Nov 2020 11:37:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 666E386806;
	Thu, 19 Nov 2020 10:37:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L0OMUrE1No9S; Thu, 19 Nov 2020 10:37:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E1D388542B;
	Thu, 19 Nov 2020 10:37:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D1A1EC0891;
	Thu, 19 Nov 2020 10:37:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7598AC0891
 for <iommu@lists.linux-foundation.org>; Thu, 19 Nov 2020 10:37:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 62ECF204E3
 for <iommu@lists.linux-foundation.org>; Thu, 19 Nov 2020 10:37:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Eb93EZsCEFk for <iommu@lists.linux-foundation.org>;
 Thu, 19 Nov 2020 10:37:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id DB5CD204D0
 for <iommu@lists.linux-foundation.org>; Thu, 19 Nov 2020 10:37:07 +0000 (UTC)
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa
 [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 92906246D3;
 Thu, 19 Nov 2020 10:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605782227;
 bh=TKCufnkL7v52leDjZA5aQSovB4YY3GyC4v0oEhprvno=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Xc3qmQwfX6dCz0aRkdTQiS5LS/CsnHRsCpU3UTuRURQqSTxLJ70tsKnJ9AXdJzIqI
 4iCg2gFoeA6HqQr1akzY3dld3Omt3QQpH785pVAxGiICa6/uOVP3zKvor98LoUzg9J
 GgXNxRjoxXp9eFoLUTFyS8mAFstlCWSyn7DwtihM=
From: Will Deacon <will@kernel.org>
To: Lu Baolu <baolu.lu@linux.intel.com>,
	Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH 1/1] iommu/vt-d: Fix compile error with CONFIG_PCI_ATS not
 set
Date: Thu, 19 Nov 2020 10:37:01 +0000
Message-Id: <160577954777.1956553.12280033649864052626.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201119055119.2862701-1-baolu.lu@linux.intel.com>
References: <20201119055119.2862701-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Cc: Will Deacon <will@kernel.org>, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Gleixner <tglx@linutronix.de>, kernel-team@android.com
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

T24gVGh1LCAxOSBOb3YgMjAyMCAxMzo1MToxOSArMDgwMCwgTHUgQmFvbHUgd3JvdGU6Cj4gRml4
IHRoZSBjb21waWxlIGVycm9yIGJlbG93IChDT05GSUdfUENJX0FUUyBub3Qgc2V0KToKPiAKPiBk
cml2ZXJzL2lvbW11L2ludGVsL2RtYXIuYzogSW4gZnVuY3Rpb24g4oCYdmZfaW5oZXJpdF9tc2lf
ZG9tYWlu4oCZOgo+IGRyaXZlcnMvaW9tbXUvaW50ZWwvZG1hci5jOjMzODo1OTogZXJyb3I6IOKA
mHN0cnVjdCBwY2lfZGV24oCZIGhhcyBubyBtZW1iZXIgbmFtZWQg4oCYcGh5c2Zu4oCZOyBkaWQg
eW91IG1lYW4g4oCYaXNfcGh5c2Zu4oCZPwo+ICAgMzM4IHwgIGRldl9zZXRfbXNpX2RvbWFpbigm
cGRldi0+ZGV2LCBkZXZfZ2V0X21zaV9kb21haW4oJnBkZXYtPnBoeXNmbi0+ZGV2KSk7Cj4gICAg
ICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXn5+fn5+Cj4gICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgaXNfcGh5c2ZuCgpBcHBsaWVkIHRvIGFybTY0IChmb3It
bmV4dC9pb21tdS9maXhlcyksIHRoYW5rcyEKClsxLzFdIGlvbW11L3Z0LWQ6IEZpeCBjb21waWxl
IGVycm9yIHdpdGggQ09ORklHX1BDSV9BVFMgbm90IHNldAogICAgICBodHRwczovL2dpdC5rZXJu
ZWwub3JnL2FybTY0L2MvMzY0NWEzNGY1Yjk2CgpDaGVlcnMsCi0tIApXaWxsCgpodHRwczovL2Zp
eGVzLmFybTY0LmRldgpodHRwczovL25leHQuYXJtNjQuZGV2Cmh0dHBzOi8vd2lsbC5hcm02NC5k
ZXYKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW9tbXUg
bWFpbGluZyBsaXN0CmlvbW11QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlz
dHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lvbW11
