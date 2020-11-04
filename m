Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C702A5FF8
	for <lists.iommu@lfdr.de>; Wed,  4 Nov 2020 09:53:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 493D286880;
	Wed,  4 Nov 2020 08:53:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PDBRuBrJMVq3; Wed,  4 Nov 2020 08:53:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A35D486594;
	Wed,  4 Nov 2020 08:53:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7B2D8C1AD7;
	Wed,  4 Nov 2020 08:53:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3301EC0051
 for <iommu@lists.linux-foundation.org>; Wed,  4 Nov 2020 08:53:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 158A02045C
 for <iommu@lists.linux-foundation.org>; Wed,  4 Nov 2020 08:53:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YViq4PrFWcY5 for <iommu@lists.linux-foundation.org>;
 Wed,  4 Nov 2020 08:53:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by silver.osuosl.org (Postfix) with ESMTP id 28C09203CA
 for <iommu@lists.linux-foundation.org>; Wed,  4 Nov 2020 08:53:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CA107AC2E;
 Wed,  4 Nov 2020 08:53:07 +0000 (UTC)
Date: Wed, 4 Nov 2020 09:53:06 +0100
From: "jroedel@suse.de" <jroedel@suse.de>
To: "Merger, Edgar [AUTOSOL/MAS/AUGS]" <Edgar.Merger@emerson.com>
Subject: Re: amdgpu error whenever IOMMU is enabled
Message-ID: <20201104085306.GQ22179@suse.de>
References: <MWHPR10MB1310CDB6829DDCF5EA84A14689150@MWHPR10MB1310.namprd10.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MWHPR10MB1310CDB6829DDCF5EA84A14689150@MWHPR10MB1310.namprd10.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>
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

SGkgRWRnYXIsCgpPbiBGcmksIE9jdCAzMCwgMjAyMCBhdCAwMjoyNjoyM1BNICswMDAwLCBNZXJn
ZXIsIEVkZ2FyIFtBVVRPU09ML01BUy9BVUdTXSB3cm90ZToKPiBXaXRoIG9uZSBib2FyZCB3ZSBo
YXZlIGEgYm9vdC1wcm9ibGVtIHRoYXQgaXMgcmVwcm9kdWNpYmxlIGF0IGV2ZXJ5IH41MCBib290
Lgo+IFRoZSBzeXN0ZW0gaXMgYWNjZXNzaWJsZSB2aWEgc3NoIGFuZCB3b3JrcyBmaW5lIGV4Y2Vw
dCBmb3IgdGhlIEdyYXBoaWNzLiBUaGUKPiBncmFwaGljcyBpcyBvZmYuIFdlIGRvbsK0dCBzZWUg
YSBzY3JlZW4uIFBsZWFzZSBzZWUgYXR0YWNoZWQg4oCcZG1lc2cubG9n4oCdLiBGcm9tCj4gWzUy
Ljc3MjI3M10gb253YXJkcyB0aGUga2VybmVsIHJlcG9ydHMgZHJtL2FtZGdwdSBlcnJvcnMuIEl0
IGV2ZW4gdHJpZXMgdG8KPiByZXNldCB0aGUgR1BVIGJ1dCB0aGF0IGZhaWxzIHRvby4gSSB0cmll
ZCB0byByZXNldCBhbWRncHUgYWxzbyBieSBjb21tYW5kIOKAnHN1ZG8KPiBjYXQgL3N5cy9rZXJu
ZWwvZGVidWcvZHJpL04vYW1kZ3B1X2dwdV9yZWNvdmVy4oCdLiBUaGF0IGRpZCBub3QgaGVscCBl
aXRoZXIuCgpDYW4geW91IHJlcHJvZHVjZSB0aGUgcHJvYmxlbSB3aXRoIGFuIHVwc3RyZWFtIGtl
cm5lbCB0b28/CgpUaGVzZSBtZXNzYWdlcyBpbiBkbWVzZyBpbmRpY2F0ZSBzb21lIHByb2JsZW0g
aW4gdGhlIHBsYXRmb3JtIHNldHVwOgoKCUFNRC1WaTogQ29tcGxldGlvbi1XYWl0IGxvb3AgdGlt
ZWQgb3V0CgpNaWdodCB0aGVyZSBiZSBzb21lIGluY29uc2lzdGVuY2llcyBpbiB0aGUgUENJIHNl
dHVwIGJldHdlZW4gdGhlIGJyaWRnZXMKYW5kIHRoZSBlbmRwb2ludHMgb3Igc29tZXRoaW5nPwoK
UmVnYXJkcywKCglKb2VyZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwppb21tdSBtYWlsaW5nIGxpc3QKaW9tbXVAbGlzdHMubGludXgtZm91bmRhdGlvbi5v
cmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vaW9t
bXU=
