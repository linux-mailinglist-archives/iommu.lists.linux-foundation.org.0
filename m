Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5CD41A91F
	for <lists.iommu@lfdr.de>; Tue, 28 Sep 2021 08:55:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3683A403D3;
	Tue, 28 Sep 2021 06:55:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VCh67ExaHBUm; Tue, 28 Sep 2021 06:55:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 3FC80404D7;
	Tue, 28 Sep 2021 06:55:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7DF8AC0025;
	Tue, 28 Sep 2021 06:55:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9F634C000D
 for <iommu@lists.linux-foundation.org>; Tue, 28 Sep 2021 05:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B94C402B9
 for <iommu@lists.linux-foundation.org>; Tue, 28 Sep 2021 05:52:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=ibm.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M-9-dPyf8M3O for <iommu@lists.linux-foundation.org>;
 Tue, 28 Sep 2021 05:52:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D66BB4019B
 for <iommu@lists.linux-foundation.org>; Tue, 28 Sep 2021 05:52:50 +0000 (UTC)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18S2MjX9036435; 
 Tue, 28 Sep 2021 01:52:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=kHULtq2vCMS9C99h1wo9Sj7LNJHpQWEoPhR9H48N/ok=;
 b=TOOXwqC0nCYmRxuVcHw5WtCEjy0er/V96K69puaC5glUNV0KhLprbnZ3T+h0EwkF3jqy
 HNN7vt09FxccRnXX0lzKavj+gopNBoY6nNhZSuUOnJLGEtPQxMWrqTQiFQ90ZTcTQTBM
 XHX8QqziyJBt+MbXMre/b+nw77DR6cxR6t7WSW/+Gtbd4dk38szXtumLkuDnJIw1gX8F
 ARd96+WYn/4/3sxl3Bf4pZSAE+BwtXJi8v7PTfoI/0z8y0eFvBGsp1nw1xI13GaFVcjr
 /Q38xHNo9bcXElFQRPvA+vFI8EN3SfXE0zW6rTcAwzyzaDGLsey4K1ttOzqMpDBQ5wDR yg== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bagrge8y5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Sep 2021 01:52:46 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18S5Rr5s011914;
 Tue, 28 Sep 2021 05:52:44 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3b9ud9t53n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Sep 2021 05:52:44 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18S5qfYi45941232
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Sep 2021 05:52:41 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7A5E642049;
 Tue, 28 Sep 2021 05:52:41 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2944B4204D;
 Tue, 28 Sep 2021 05:52:41 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 28 Sep 2021 05:52:41 +0000 (GMT)
Received: from [9.81.209.82] (unknown [9.81.209.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 3FFB06035F;
 Tue, 28 Sep 2021 15:52:39 +1000 (AEST)
Subject: Re: [PATCH v2 8/9] ocxl: Use pci core's DVSEC functionality
To: Ben Widawsky <ben.widawsky@intel.com>, linux-cxl@vger.kernel.org
References: <20210923172647.72738-1-ben.widawsky@intel.com>
 <20210923172647.72738-9-ben.widawsky@intel.com>
From: Andrew Donnellan <ajd@linux.ibm.com>
Message-ID: <70917485-8f6b-d602-45d6-dc1e873db050@linux.ibm.com>
Date: Tue, 28 Sep 2021 15:52:38 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210923172647.72738-9-ben.widawsky@intel.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LoGoudR3s7_zyFsgpCAcskiJYmAWByyl
X-Proofpoint-ORIG-GUID: LoGoudR3s7_zyFsgpCAcskiJYmAWByyl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-28_03,2021-09-24_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 phishscore=0 mlxscore=0
 adultscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109280033
X-Mailman-Approved-At: Tue, 28 Sep 2021 06:55:17 +0000
Cc: David Woodhouse <dwmw2@infradead.org>, iommu@lists.linux-foundation.org,
 Bjorn Helgaas <helgaas@kernel.org>,
 "David E. Box" <david.e.box@linux.intel.com>, linux-pci@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Kan Liang <kan.liang@linux.intel.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 24/9/21 3:26 am, Ben Widawsky wrote:
> Reduce maintenance burden of DVSEC query implementation by using the
> centralized PCI core implementation.
> 
> There are two obvious places to simply drop in the new core
> implementation. There remains find_dvsec_from_pos() which would benefit
> from using a core implementation. As that change is less trivial it is
> reserved for later.
> 
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: Andrew Donnellan <ajd@linux.ibm.com>
> Acked-by: Frederic Barrat <fbarrat@linux.ibm.com> (v1)
> Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>

Looks fine, but we should clean up find_dvsec_from_pos() afterwards.

Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>

-- 
Andrew Donnellan              OzLabs, ADL Canberra
ajd@linux.ibm.com             IBM Australia Limited
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
