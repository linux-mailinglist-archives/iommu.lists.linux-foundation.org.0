Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0083845142
	for <lists.iommu@lfdr.de>; Fri, 14 Jun 2019 03:40:41 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id DC592E20;
	Fri, 14 Jun 2019 01:40:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C3461B6C
	for <iommu@lists.linux-foundation.org>;
	Fri, 14 Jun 2019 01:40:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 591DA711
	for <iommu@lists.linux-foundation.org>;
	Fri, 14 Jun 2019 01:40:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Jun 2019 18:40:36 -0700
X-ExtLoop1: 1
Received: from lftan-mobl.gar.corp.intel.com (HELO ubuntu) ([10.226.248.78])
	by fmsmga007.fm.intel.com with SMTP; 13 Jun 2019 18:40:34 -0700
Received: by ubuntu (sSMTP sendmail emulation); Fri, 14 Jun 2019 09:40:34 +0800
Message-ID: <1560476434.21652.1.camel@intel.com>
Subject: Re: switch nios2 and microblaze to use the generic uncached
	segement support
From: Ley Foon Tan <ley.foon.tan@intel.com>
To: Christoph Hellwig <hch@lst.de>, Michal Simek <monstr@monstr.eu>
Date: Fri, 14 Jun 2019 09:40:34 +0800
In-Reply-To: <20190603065324.9724-1-hch@lst.de>
References: <20190603065324.9724-1-hch@lst.de>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

T24gTW9uLCAyMDE5LTA2LTAzIGF0IDA4OjUzICswMjAwLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90
ZToKPiBIaSBhbGwsCj4gCj4gY2FuIHlvdSB0YWtlIGEgbG9vayBhdCB0aGlzIHNlcmllcz/CoMKg
SXQgc3dpdGNoZXMgbmlvcHMyIGFuZAo+IG1pY3JvYmxhemUgdG8KPiB1c2UgdGhlIGdlbmVyaWMg
ZG1hIGxheWVyIHN1cHBvcnQgZm9yIHVuY2FjaGVkIHNlZ2VtZW50cy4KPiAKPiBUaGUgZG1hIG1h
cHBpbmcgZm9yLW5leHQgZ2l0IHRyZWUgdGhhdCBpbmNsdWRlcyB0aGUgc3VwcG9ydCBpcwo+IGF2
YWlsYWJsZQo+IGhlcmU6Cj4gCj4gwqDCoMKgwqBnaXQ6Ly9naXQuaW5mcmFkZWFkLm9yZy91c2Vy
cy9oY2gvZG1hLW1hcHBpbmcuZ2l0IGZvci1uZXh0Cj4gCj4gR2l0d2ViOgo+IAo+IMKgwqDCoMKg
aHR0cDovL2dpdC5pbmZyYWRlYWQub3JnL3VzZXJzL2hjaC9kbWEtbWFwcGluZy5naXQvc2hvcnRs
b2cvcmVmcy8KPiBoZWFkcy9mb3ItbmV4dAo+IAoKSGnCoENocmlzdG9waAoKQ2FuIHRoaXMgcGF0
Y2ggaW7CoGh0dHA6Ly9naXQuaW5mcmFkZWFkLm9yZy91c2Vycy9oY2gvZG1hLW1hcHBpbmcuZ2l0
L3NoCm9ydGxvZy9yZWZzL2hlYWRzL2Zvci1uZXh0CgpbUEFUQ0ggMS8yXSBuaW9zMjogdXNlIHRo
ZSBnZW5lcmljIHVuY2FjaGVkIHNlZ21lbnQgc3VwcG9ydCBpbiBkbWEtCmRpcmVjdAoKUmVnYXJk
cwpMZXkgRm9vbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwppb21tdSBtYWlsaW5nIGxpc3QKaW9tbXVAbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0
cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vaW9tbXU=
