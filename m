Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0C81EB323
	for <lists.iommu@lfdr.de>; Tue,  2 Jun 2020 03:50:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 706A587E9B;
	Tue,  2 Jun 2020 01:50:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ljftwt1KYlXD; Tue,  2 Jun 2020 01:50:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 09D9387E97;
	Tue,  2 Jun 2020 01:50:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DD99FC0176;
	Tue,  2 Jun 2020 01:50:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A1719C088C
 for <iommu@lists.linux-foundation.org>; Tue,  2 Jun 2020 01:50:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 970B987E9B
 for <iommu@lists.linux-foundation.org>; Tue,  2 Jun 2020 01:50:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s1XgBfzLoNqm for <iommu@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 01:50:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from out30-56.freemail.mail.aliyun.com
 (out30-56.freemail.mail.aliyun.com [115.124.30.56])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5317587E97
 for <iommu@lists.linux-foundation.org>; Tue,  2 Jun 2020 01:50:49 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R211e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04426;
 MF=baolin.wang@linux.alibaba.com; NM=1; PH=DS; RN=5; SR=0;
 TI=SMTPD_---0U-Kjvi7_1591062644; 
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com
 fp:SMTPD_---0U-Kjvi7_1591062644) by smtp.aliyun-inc.com(127.0.0.1);
 Tue, 02 Jun 2020 09:50:44 +0800
Date: Tue, 2 Jun 2020 09:50:44 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [PATCH] iommu: Improve exception handling in iommu_group_alloc()
Message-ID: <20200602015044.GA89266@VM20190228-100.tbsite.net>
References: <9f8d8308-2056-8e33-7b38-0b7d96e51c3c@web.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9f8d8308-2056-8e33-7b38-0b7d96e51c3c@web.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: kernel-janitors@vger.kernel.org, iommu@lists.linux-foundation.org,
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
Reply-To: Baolin Wang <baolin.wang@linux.alibaba.com>
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

T24gTW9uLCBKdW4gMDEsIDIwMjAgYXQgMDI6Mzg6MDVQTSArMDIwMCwgTWFya3VzIEVsZnJpbmcg
d3JvdGU6Cj4gPiBPcHRpbWl6ZSB0aGUgZXJyb3IgaGFuZGxpbmcgdG8gZnJlZSB0aGUgcmVzb3Vy
Y2VzIGNvcnJlY3RseSB3aGVuCj4gPiBmYWlsZWQgdG8gYWxsb2NhdGUgYW4gaW9tbXUgZ3JvdXAu
Cj4gCj4gKiBJIHdvdWxkIG5vdCBjYXRlZ29yaXNlIHRoZSBkZXNpcmVkIGNvbXBsZXRpb24gb2Yg
ZXhjZXB0aW9uIGhhbmRsaW5nCj4gICBhcyBhIHNvZnR3YXJlIG9wdGltaXNhdGlvbi4KPiAKPiAq
IFdvdWxkIHlvdSBsaWtlIHRvIGFkZCB0aGUgdGFnIKGwRml4ZXOhsSB0byB0aGUgY29tbWl0IG1l
c3NhZ2U/CgpTdXJlLgoKPiAKPiAqIEkgc3VnZ2VzdCB0byBhdm9pZCB0aGUgc3BlY2lmaWNhdGlv
biBvZiBkdXBsaWNhdGUgZnVuY3Rpb24gY2FsbHMuCj4gICBXaWxsIGl0IGJlIGhlbHBmdWwgdG8g
YWRkIGEgZmV3IGp1bXAgdGFyZ2V0cz8KPiAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3Nj
bS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL0RvY3VtZW50YXRpb24v
cHJvY2Vzcy9jb2Rpbmctc3R5bGUucnN0P2lkPTNkNzdlNmE4ODA0YWJjYzA1MDRjOTA0YmQ2ZTVj
ZGYzYTVjZjgxNjIjbjQ1NQoKSSBkb24ndCB0aGluayBpdCBpcyBoZWxwZnVsIG9yIHJlYWRhYmxl
IHRvIGFkZCBzb21lIGp1bXAgdGFyZ2V0cyBoZXJlLCBzaW5jZSB0aGUgZXhjZXB0aW9uIGhhbmRs
aW5nIGlzIHZlcnkgc2ltcGxlIGhlcmUuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwppb21tdSBtYWlsaW5nIGxpc3QKaW9tbXVAbGlzdHMubGludXgtZm91
bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlz
dGluZm8vaW9tbXU=
