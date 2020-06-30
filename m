Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0BA20F200
	for <lists.iommu@lfdr.de>; Tue, 30 Jun 2020 11:57:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5502B87CAC;
	Tue, 30 Jun 2020 09:57:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tgV6bCVJar4z; Tue, 30 Jun 2020 09:57:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B11F987D47;
	Tue, 30 Jun 2020 09:57:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8EF5BC016E;
	Tue, 30 Jun 2020 09:57:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 78D31C016E
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 09:57:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6DC1985C5C
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 09:57:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1xdxyPdwz5Xg for <iommu@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 09:57:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3C4E985C19
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 09:57:25 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 3A07426B; Tue, 30 Jun 2020 11:57:23 +0200 (CEST)
Date: Tue, 30 Jun 2020 11:57:21 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Qian Cai <cai@lca.pw>
Subject: Re: [PATCH v2 0/2] iommu/amd: Don't use atomic64_t for domain->pt_root
Message-ID: <20200630095721.GI28824@8bytes.org>
References: <20200626080547.24865-1-joro@8bytes.org>
 <63D91069-6A2E-4C05-8409-76A56D1E0FCA@lca.pw>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <63D91069-6A2E-4C05-8409-76A56D1E0FCA@lca.pw>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org, Joerg Roedel <jroedel@suse.de>,
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

T24gRnJpLCBKdW4gMjYsIDIwMjAgYXQgMDg6MzA6MjFBTSAtMDQwMCwgUWlhbiBDYWkgd3JvdGU6
Cj4gQlRXLCBmcm9tIHRoZSBwcmV2aW91cyBkaXNjdXNzaW9uLCBMaW51cyBtZW50aW9uZWQsCj4g
IAo+IOKAnAo+IFRoZSB0aGluZyBpcywgdGhlIDY0LWJpdCBhdG9taWMgcmVhZHMvd3JpdGVzIGFy
ZSB2ZXJ5IGV4cGVuc2l2ZSBvbgo+IDMyLWJpdCB4ODYuIElmIGl0IHdhcyBqdXN0IGEgbmF0aXZl
IHBvaW50ZXIsIGl0IHdvdWxkIGJlIG11Y2ggY2hlYXBlcgo+IHRoYW4gYW4gImF0b21pYzY0X3Qi
Lgo+IOKAnAo+IAo+IEhvd2V2ZXIsIGhlcmUgd2UgaGF2ZSBBTURfSU9NTVUgZGVwZW5kIG9uIHg4
Nl82NCwgc28gSSBhbSB3b25kZXJpbmcgaWYKPiBpdCBtYWtlcyBhbnkgc2Vuc2UgdG8gcnVuIHRo
aXMgY29kZSBvbiAzMi1iaXQgeDg2IGF0IGFsbD8KCk5vLCBpdCBkb2Vzbid0LCB0aGUgZHJpdmVy
IGlzIG5vdCBzdXBwb3J0ZWQgb24gMzJiaXQgYW5kIHByb2JhYmx5IG5ldmVyCndpbGwuIEkgc2tp
cCB0aGlzIHBhdGNoIGFuZCBvbmx5IGFwcGx5IHRoZSBmaXJzdCBvbmUsIGFzIGl0IGlzIGFuCmlt
cHJvdmVtZW50IGluIGl0c2VsZi4KClJlZ2FyZHMsCgoJSm9lcmcKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW9tbXUgbWFpbGluZyBsaXN0CmlvbW11QGxp
c3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2lvbW11
