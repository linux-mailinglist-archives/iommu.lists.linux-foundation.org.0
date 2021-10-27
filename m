Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id CD69143C4B2
	for <lists.iommu@lfdr.de>; Wed, 27 Oct 2021 10:08:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54A3D4030C;
	Wed, 27 Oct 2021 08:08:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tLQf0VPLmexw; Wed, 27 Oct 2021 08:08:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 876A8402FE;
	Wed, 27 Oct 2021 08:08:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 703EAC0036;
	Wed, 27 Oct 2021 08:08:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C0AD1C000E
 for <iommu@lists.linux-foundation.org>; Wed, 27 Oct 2021 08:08:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A273960627
 for <iommu@lists.linux-foundation.org>; Wed, 27 Oct 2021 08:08:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CG5cg22v77_B for <iommu@lists.linux-foundation.org>;
 Wed, 27 Oct 2021 08:08:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 18F5360620
 for <iommu@lists.linux-foundation.org>; Wed, 27 Oct 2021 08:08:41 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 7DA64452; Wed, 27 Oct 2021 10:08:38 +0200 (CEST)
Date: Wed, 27 Oct 2021 10:08:37 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Sven Peter <sven@svenpeter.dev>
Subject: Re: [PATCH] iommu/dart: Initialize DART_STREAMS_ENABLE
Message-ID: <YXkJBXCnzZ/MgYFV@8bytes.org>
References: <20211019162253.45919-1-sven@svenpeter.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211019162253.45919-1-sven@svenpeter.dev>
Cc: Martin =?utf-8?Q?Povi=C5=A1er?= <povik@protonmail.com>,
 Hector Martin <marcan@marcan.st>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Will Deacon <will@kernel.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
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

T24gVHVlLCBPY3QgMTksIDIwMjEgYXQgMDY6MjI6NTNQTSArMDIwMCwgU3ZlbiBQZXRlciB3cm90
ZToKPiBEQVJUIGhhcyBhbiBhZGRpdGlvbmFsIGdsb2JhbCByZWdpc3RlciB0byBjb250cm9sIHdo
aWNoIHN0cmVhbXMgYXJlCj4gaXNvbGF0ZWQuIFRoaXMgcmVnaXN0ZXIgaXMgYSBiaXQgcmVkdW5k
YW50IHNpbmNlIERBUlRfVENSIGNhbiBhbHJlYWR5Cj4gYmUgdXNlZCB0byBjb250cm9sIGlzb2xh
dGlvbiBhbmQgaXMgdXN1YWxseSBpbml0aWFsaXplZCB0byBEQVJUX1NUUkVBTV9BTEwKPiBieSB0
aGUgdGltZSB3ZSBnZXQgY29udHJvbC4gU29tZSBEQVJUcyAobmFtZWx5IHRoZSBvbmUgdXNlZCBm
b3IgdGhlIGF1ZGlvCj4gY29udHJvbGxlcikgaG93ZXZlciBoYXZlIHNvbWUgc3RyZWFtcyBkaXNh
YmxlZCBpbml0aWFsbHkuIE1ha2Ugc3VyZSB0aG9zZQo+IHdvcmsgYnkgaW5pdGlhbGl6aW5nIERB
UlRfU1RSRUFNU19FTkFCTEUgZHVyaW5nIHJlc2V0Lgo+IAo+IFJlcG9ydGVkLWJ5OiBNYXJ0aW4g
UG92acWhZXIgPHBvdmlrQHByb3Rvbm1haWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFN2ZW4gUGV0
ZXIgPHN2ZW5Ac3ZlbnBldGVyLmRldj4KPiAtLS0KCkFwcGxpZWQsIHRoYW5rcy4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlvbW11IG1haWxpbmcgbGlz
dAppb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91
bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9pb21tdQ==
