Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 641181393C2
	for <lists.iommu@lfdr.de>; Mon, 13 Jan 2020 15:36:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1ADF98660A;
	Mon, 13 Jan 2020 14:36:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VfPI9ULgeax1; Mon, 13 Jan 2020 14:36:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B8A0A86632;
	Mon, 13 Jan 2020 14:36:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9E963C077D;
	Mon, 13 Jan 2020 14:36:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AA54EC077D
 for <iommu@lists.linux-foundation.org>; Mon, 13 Jan 2020 14:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A174C84F69
 for <iommu@lists.linux-foundation.org>; Mon, 13 Jan 2020 14:36:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sjjebs40WorI for <iommu@lists.linux-foundation.org>;
 Mon, 13 Jan 2020 14:36:39 +0000 (UTC)
X-Greylist: delayed 00:36:55 by SQLgrey-1.7.6
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C7CCA8442D
 for <iommu@lists.linux-foundation.org>; Mon, 13 Jan 2020 14:36:38 +0000 (UTC)
Received: from wf0253.dip.tu-dresden.de ([141.76.180.253] helo=phil.localnet)
 by gloria.sntech.de with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <heiko@sntech.de>)
 id 1ir0Fd-0003DP-Se; Mon, 13 Jan 2020 14:59:29 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] drm/rockchip: Add missing vmalloc header
Date: Mon, 13 Jan 2020 14:59:29 +0100
Message-ID: <1782062.vAMIso9ooe@phil>
In-Reply-To: <1577779956-7612-1-git-send-email-krzk@kernel.org>
References: <1577779956-7612-1-git-send-email-krzk@kernel.org>
MIME-Version: 1.0
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, David Airlie <airlied@linux.ie>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 iommu@lists.linux-foundation.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org
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

QW0gRGllbnN0YWcsIDMxLiBEZXplbWJlciAyMDE5LCAwOToxMjozNiBDRVQgc2NocmllYiBLcnp5
c3p0b2YgS296bG93c2tpOgo+IFRoZSBSb2Nrc2hpcCBEUk0gR0VNIGNvZGUgdXNlcyB2bWFwKCkv
dnVubWFwKCkgc28gdm1hbGxvYyBoZWFkZXIgbXVzdCBiZQo+IGluY2x1ZGVkIHRvIGF2b2lkIHdh
cm5pbmdzIGxpa2UgKG9uIElBNjQsIGNvbXBpbGUgdGVzdGVkKToKPiAKPiAgICAgZHJpdmVycy9n
cHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV9nZW0uYzogSW4gZnVuY3Rpb24g4oCYcm9ja2No
aXBfZ2VtX2FsbG9jX2lvbW114oCZOgo+ICAgICBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9j
a2NoaXBfZHJtX2dlbS5jOjEzNDoyMDogZXJyb3I6Cj4gICAgICAgICBpbXBsaWNpdCBkZWNsYXJh
dGlvbiBvZiBmdW5jdGlvbiDigJh2bWFw4oCZIFstV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRl
Y2xhcmF0aW9uXQo+IAo+IFJlcG9ydGVkLWJ5OiBrYnVpbGQgdGVzdCByb2JvdCA8bGtwQGludGVs
LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5v
cmc+CgphcHBsaWVkIHRvIGRybS1taXNjLW5leHQKClRoYW5rcwpIZWlrbwoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlvbW11IG1haWxpbmcgbGlzdApp
b21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRh
dGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9pb21tdQ==
