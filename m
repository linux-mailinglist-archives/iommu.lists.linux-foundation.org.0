Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id AF48A2926FA
	for <lists.iommu@lfdr.de>; Mon, 19 Oct 2020 14:07:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 73E45875FA;
	Mon, 19 Oct 2020 12:07:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lvdEWO41YtuA; Mon, 19 Oct 2020 12:07:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C923E875F2;
	Mon, 19 Oct 2020 12:07:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A89AAC0051;
	Mon, 19 Oct 2020 12:07:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7BF2EC0051
 for <iommu@lists.linux-foundation.org>; Mon, 19 Oct 2020 12:07:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7750A86DCC
 for <iommu@lists.linux-foundation.org>; Mon, 19 Oct 2020 12:07:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hkBxf15RslFh for <iommu@lists.linux-foundation.org>;
 Mon, 19 Oct 2020 12:07:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E4BA386B18
 for <iommu@lists.linux-foundation.org>; Mon, 19 Oct 2020 12:07:14 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id B88B5E97; Mon, 19 Oct 2020 14:07:11 +0200 (CEST)
Date: Mon, 19 Oct 2020 14:07:09 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH next] iommu: intel: don't dereference iommu_device if
 IOMMU_API is not built
Message-ID: <20201019120708.GE3635@8bytes.org>
References: <20201013073055.11262-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201013073055.11262-1-brgl@bgdev.pl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 iommu@lists.linux-foundation.org, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org
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

T24gVHVlLCBPY3QgMTMsIDIwMjAgYXQgMDk6MzA6NTVBTSArMDIwMCwgQmFydG9zeiBHb2xhc3pl
d3NraSB3cm90ZToKPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5
bGlicmUuY29tPgo+IAo+IFNpbmNlIGNvbW1pdCBjNDBhYWFhYzEwMTggKCJpb21tdS92dC1kOiBH
cmFjZWZ1bGx5IGhhbmRsZSBETUFSIHVuaXRzCj4gd2l0aCBubyBzdXBwb3J0ZWQgYWRkcmVzcyB3
aWR0aHMiKSBkbWFyLmMgbmVlZHMgc3RydWN0IGlvbW11X2RldmljZSB0bwo+IGJlIHNlbGVjdGVk
LiBXZSBjYW4gZHJvcCB0aGlzIGRlcGVuZGVuY3kgYnkgbm90IGRlcmVmZXJlbmNpbmcgc3RydWN0
Cj4gaW9tbXVfZGV2aWNlIGlmIElPTU1VX0FQSSBpcyBub3Qgc2VsZWN0ZWQgYW5kIGJ5IHJldXNp
bmcgdGhlIGluZm9ybWF0aW9uCj4gc3RvcmVkIGluIGlvbW11LT5kcmhkLT5pZ25vcmVkIGluc3Rl
YWQuCj4gCj4gVGhpcyBmaXhlcyB0aGUgZm9sbG93aW5nIGJ1aWxkIGVycm9yIHdoZW4gSU9NTVVf
QVBJIGlzIG5vdCBzZWxlY3RlZDoKPiAKPiBkcml2ZXJzL2lvbW11L2ludGVsL2RtYXIuYzogSW4g
ZnVuY3Rpb24g4oCYZnJlZV9pb21tdeKAmToKPiBkcml2ZXJzL2lvbW11L2ludGVsL2RtYXIuYzox
MTM5OjQxOiBlcnJvcjog4oCYc3RydWN0IGlvbW11X2RldmljZeKAmSBoYXMgbm8gbWVtYmVyIG5h
bWVkIOKAmG9wc+KAmQo+ICAxMTM5IHwgIGlmIChpbnRlbF9pb21tdV9lbmFibGVkICYmIGlvbW11
LT5pb21tdS5vcHMpIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBeCj4gCj4gRml4ZXM6IGM0MGFhYWFjMTAxOCAoImlvbW11L3Z0LWQ6IEdyYWNlZnVs
bHkgaGFuZGxlIERNQVIgdW5pdHMgd2l0aCBubyBzdXBwb3J0ZWQgYWRkcmVzcyB3aWR0aHMiKQo+
IFNpZ25lZC1vZmYtYnk6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJnb2xhc3pld3NraUBiYXlsaWJy
ZS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvaW9tbXUvaW50ZWwvZG1hci5jIHwgMiArLQo+ICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCkFwcGxpZWQsIHRoYW5r
cy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlvbW11
IG1haWxpbmcgbGlzdAppb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xp
c3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9pb21tdQ==
