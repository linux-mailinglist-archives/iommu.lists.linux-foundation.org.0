Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8991367FD
	for <lists.iommu@lfdr.de>; Fri, 10 Jan 2020 08:11:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 58D93204D9;
	Fri, 10 Jan 2020 07:11:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W71mW4TppfGK; Fri, 10 Jan 2020 07:11:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 7AD9A2040E;
	Fri, 10 Jan 2020 07:11:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6DAD9C0881;
	Fri, 10 Jan 2020 07:11:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5AD53C0881
 for <iommu@lists.linux-foundation.org>; Fri, 10 Jan 2020 07:11:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 569DF2040E
 for <iommu@lists.linux-foundation.org>; Fri, 10 Jan 2020 07:11:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gtIcu4tglN3k for <iommu@lists.linux-foundation.org>;
 Fri, 10 Jan 2020 07:11:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.51])
 by silver.osuosl.org (Postfix) with ESMTPS id 3C6BA203A9
 for <iommu@lists.linux-foundation.org>; Fri, 10 Jan 2020 07:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1578640273;
 s=strato-dkim-0002; d=xenosoft.de;
 h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=TC+tjX/Lt65GMWtVyL5Xhep5tinocrAB9X7xhvNdnXY=;
 b=TpUMWWqhkAvy5bNex/uzVDdzK9T2bEVS9AoQYC7M0MzdEt0xigsFPXT53Lt4lMCrrO
 spSY0fsE7XgCJ8t8FZurbma+5XMU+FTjNk0hEiNN+Z6GmkuOtPkyVLu+r4AYCGFSA1Ze
 mYx4+zks/1es8Iy0iKWMU4lVOB1NuHLILmIejjoq+NmyrCX4WM8hiVjBtLqwlXVJ6bF+
 aFV/F31qXN8I20NOQYS+zx7zxURk5Pp9IXA0hFFQqjCAs03IzD1uN0NRbTFonURCC75a
 fOOpTiS6jSX680wX+qjORm6nGtLvzonP0HxefyoKB22SmEK5QzpP2hR77LAMDMmp7Fh5
 Mxjw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7R7NWd5jbpkxCcXi3g8qXe4kYOYilnn348Kw8dzMjA="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a01:598:8086:10a9:904f:8bb2:ac2:590a]
 by smtp.strato.de (RZmta 46.1.4 AUTH) with ESMTPSA id c05c1aw0A7AT8Ab
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 10 Jan 2020 08:10:29 +0100 (CET)
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Mime-Version: 1.0 (1.0)
Subject: Re: Bug 205201 - Booting halts if Dawicontrol DC-2976 UW SCSI board
 installed, unless RAM size limited to 3500M
Date: Fri, 10 Jan 2020 08:10:28 +0100
Message-Id: <533E86ED-00F4-4FB2-9D91-D4705088817D@xenosoft.de>
References: <20191204085634.GA25929@lst.de>
In-Reply-To: <20191204085634.GA25929@lst.de>
To: Christoph Hellwig <hch@lst.de>
X-Mailer: iPhone Mail (17B111)
Cc: linux-arch@vger.kernel.org, darren@stevens-zone.net, rtd2@xtra.co.nz,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-kernel@vger.kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 paulus@samba.org, mad skateman <madskateman@gmail.com>,
 "contact@a-eon.com" <contact@a-eon.com>, Robin Murphy <robin.murphy@arm.com>,
 nsaenzjulienne@suse.de
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

Hi All,

The SCSI cards work again. [1, 2]

Sorry for bothering you.

Thanks,
Christian

[1] http://forum.hyperion-entertainment.com/viewtopic.php?f=58&p=49603&sid=1adf9e6d558c136c1ad4ff15c44212ba#p49599
[2] https://bugzilla.kernel.org/show_bug.cgi?id=205201
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
